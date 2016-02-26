# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-newlisp-mode-git
pkgver=56.ac23be4
pkgrel=1
pkgdesc="newLISP editing mode for Emacs"
arch=('any')
url="https://github.com/kosh04/newlisp-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-newlisp')
conflicts=('emacs-newlisp')
install=emacs-newlisp-mode.install
source=('git://github.com/kosh04/newlisp-mode.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/newlisp-mode
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/newlisp-mode
  emacs -Q -batch -L . -f batch-byte-compile newlisp-mode.el
}

package() {
  cd "$srcdir/newlisp-mode"
  install -Dm644 newlisp-mode.el $pkgdir/usr/share/emacs/site-lisp/newlisp-mode.el
  install -Dm644 newlisp-mode.elc $pkgdir/usr/share/emacs/site-lisp/newlisp-mode.elc
}
