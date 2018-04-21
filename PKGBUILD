# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-hexrgb
pkgver=1019
pkgrel=1
pkgdesc="Bookmark+ mode, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('awk')
source=("http://www.emacswiki.org/emacs/download/hexrgb.el")
md5sums=('0381aa8c611099ee533cf014b0459bc9')

pkgver() {
  cd $srcdir
  awk '/Update #:/ {print $4}' hexrgb.el
}

build() {
  emacs -Q -batch -L . -f batch-byte-compile hexrgb.el || true
}

package() {
  cd "${srcdir}"
  install -Dm644 hexrgb.el{,c} -t "${pkgdir}"/usr/share/emacs/site-lisp/
}
