;; TODO:
;; Add general.el instead of evil leader

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))



;; USE-PACKAGE
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; MISCELLANEOUS 
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)

;;ALCHEMIST - Elixir tools
(use-package alchemist
  :ensure t)

;; HELM
(use-package helm
  :ensure t
  :config (helm-mode 1))

;; EVIL MODE
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; GENERAL
(use-package general
  :ensure t
  :config
  (setq general-default-keymaps 'evil-normal-state-map)
  (general-define-key :prefix "<SPC>"
		      "f" 'helm-find-files
		      "p" 'helm-projectile
		      "b" 'helm-buffers-list
		      "<SPC>" 'helm-M-x))

;; PROJECTILE
(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  (use-package helm-projectile
    :ensure t
    :config (helm-projectile-on)))

;; COMPANY
(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map (kbd "RET") 'company-complete)
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "S-<tab>") 'company-select-previous))

(use-package flycheck
  :ensure t
  :commands flycheck-mode)

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (which-key-mode t))
