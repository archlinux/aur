# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-company-mode-git
pkgver=0.9.4.42.g4004c7f
pkgrel=1
pkgdesc="Modular in-buffer completion framework for Emacs - git checkout"
url="http://company-mode.github.io"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
conflicts=('emacs-company-mode')
provides=('emacs-company-mode')
source=("git+https://github.com/company-mode/company-mode.git")
sha256sums=('SKIP')
_gitname=${pkgname%-git}
_gitname=${_gitname#emacs-}

pkgver() {
  cd $_gitname
  git describe --tags|tr - .
}

build() {
  cd $_gitname
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd $_gitname
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/company-mode
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/company-mode/
}
