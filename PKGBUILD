# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-spaceline
pkgver=2.0.1
pkgrel=1
pkgdesc="Powerline theme from Spacemacs"
url="https://github.com/TheBB/spaceline"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-powerline' 'emacs-s')
optdepends=("emacs-persp-mode: Show current workspace name"
            "emacs-winum: Show current window number"
	    "emacs-auto-compile: Show auto-compile warnings as they occur"
	    "emacs-anzu: Show total number of matches while searching"
	    "flycheck: Show number of errors, warnings, and notifications"
	    "emacs-erc: IRC client notifications"
	    "emacs-org-mode: Show currently-clocking org-mode task"
	    "emacs-org-pomodoro: Show pomodoro clocks"
	    "emacs-pyenv-mode: Show currently active environments"
	    "emacs-pyvenv: Show currently active environments"
	    "emacs-nyan-mode: Show current position in the buffer with kittens and rainbows"
	    "emacs-fancy-battery: Shows battery information in the modeline"
	    "emacs-evil: Show current Evil state")
makedepends=('git')
provides=('emacs-spaceline')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheBB/spaceline/archive/v${pkgver}.tar.gz")
sha256sums=('b060d63b3e3b71b65d0406d5c6e730efb6a7fa95cacc21d0e53f705e44559314')
install=${pkgname}.install

build() {
  cd "${srcdir}/spaceline-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile spaceline*.el
}

package() {
  cd "${srcdir}/spaceline-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/spaceline"
  install -m644 spaceline*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/spaceline/"
}
