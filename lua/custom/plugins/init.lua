-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      }

      local api = require 'nvim-tree.api'

      vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find file in explorer' })
      vim.keymap.set('n', '<leader>et', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'Exafunction/windsurf.nvim',
    enabled = true,
    version = '1.8.37',
    event = 'InsertEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {}
    end,
  },
  {
    'tpope/vim-fugitive',
    event = 'InsertEnter',
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
    {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {}

        vim.keymap.set('n', '<leader>ha', function()
          harpoon:list():add()
        end)
        vim.keymap.set('n', '<leader>ht', function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
      end,
    },
  },
}
