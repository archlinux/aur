# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
_base=newlisp-mode
pkgname=emacs-${_base}-git
pkgver=56.ac23be4
pkgrel=1
pkgdesc="newLISP editing mode for Emacs"
arch=(any)
url="https://github.com/kosh04/${_base}"
license=(GPL3)
depends=(emacs)
makedepends=(git)
provides=(emacs-newlisp)
conflicts=(emacs-newlisp)
install=emacs-${_base}.install
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_base}
  emacs -Q -batch -L . -f batch-byte-compile ${_base}.el
}

package() {
  cd ${_base}
  install -Dm644 ${_base}.el ${pkgdir}/usr/share/emacs/site-lisp/${_base}.el
  install -Dm644 ${_base}.elc $pkgdir/usr/share/emacs/site-lisp/${_base}.elc
}
