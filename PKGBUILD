# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus
pkgver=2021.09.19.r15072
pkgrel=1
pkgdesc="Bookmark+ package, which enhances vanilla Emacs bookmarks in many ways"
url="https://github.com/emacsmirror/bookmark-plus.git"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('git' 'awk')
source=($pkgname::git+https://github.com/emacsmirror/bookmark-plus.git#commit=d03fb70a85d952383c41ffb3728668d4f28da0a5)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf %s.r%s $(awk '/Version/ {print $3}' bookmark+.el) $(awk '/Update / {print $4}' bookmark+.el)
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
