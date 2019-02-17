# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=auctex-latexmk
pkgver=1.0.2
pkgrel=1
pkgdesc='latexmk support for auctex'
arch=('any')
url="https://github.com/tom-tan/$pkgname"
license=('GPL')
depends=('auctex')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('980c40c5781b2cd2ec15d21c1801547cdc4e18a44dfcb07473f046fefe2f5857')

build() {
  cd $pkgname-$pkgver
  emacs -Q -batch \
	-L . \
	-L /usr/share/emacs/site-lisp/auctex \
	-L /usr/share/emacs/site-lisp/ \
	-f batch-byte-compile "$pkgname".el
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 $pkgname.el{,c} \
	  "$pkgdir"/usr/share/emacs/site-lisp
}
