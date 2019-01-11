# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus
pkgver=2018.10.17
pkgrel=2
pkgdesc="Bookmark+ package, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('git')
source=($pkgname::git+https://github.com/emacsmirror/bookmark-plus.git#commit=971114b9a271847bcc495b2254f74e9039ca4be0)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  awk '/Version/ {print $3}' bookmark+.el
}

build() {
  cd $pkgname
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd $pkgname
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp/
}
