# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mkcl
pkgver=1.1.9
pkgrel=1
pkgdesc="ManKai Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/mkcl/"
license=('LGPL3' 'custom')
depends=('gawk')
makedepends=('git')
provides=('common-lisp' 'cl-asdf')
conflicts=('mkcl')
source=("http://common-lisp.net/project/$pkgname/releases/$pkgname-$pkgver.tar.gz")
options=('staticlibs' '!makeflags')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CC=gcc ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
  install -m 644 -D "Copyright" \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  find "$pkgdir" -name "*.a" -exec chmod 644 {} \;
}
