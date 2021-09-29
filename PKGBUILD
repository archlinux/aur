# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus
pkgver=2021.04.18
pkgrel=1
pkgdesc="Bookmark+ package, which enhances vanilla Emacs bookmarks in many ways"
url="https://github.com/emacsmirror/bookmark-plus.git"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('git')
source=($pkgname::git+https://github.com/emacsmirror/bookmark-plus.git#commit=bd56210898498be3aa4cea4777529abc92378359)
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
