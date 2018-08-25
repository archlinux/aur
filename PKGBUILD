# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-font-lock-plus
pkgver=218
pkgrel=1
pkgdesc="Enhancements to standard library 'font-lock.el'."
url="https://www.emacswiki.org/emacs/font-lock%2B.el"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git' 'awk')
provides=('emacs-font-lock-plus')
source=("font-lock+.el::https://www.emacswiki.org/emacs/download/font-lock%2B.el")
sha256sums=('e4ce731106a5baef872bf03ad5ee30bcfa7f163102813a60e1552e48ecf72705')

pkgver() {
  awk  '/Update #:/ {print $4}' font-lock+.el
}
  
build() {
  emacs -Q -batch -L . -f batch-byte-compile font-lock+.el
}

package() {
  install -d "$pkgdir"/usr/share/emacs/site-lisp/font-lock-plus/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/font-lock-plus/
}
