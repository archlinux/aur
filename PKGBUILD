# Maintainer: Mark Blakeney <mark dot blakeney at bullet-systems dot net>
pkgname=jimtcl
pkgver=0.83
pkgrel=2
pkgdesc="Jim Tcl - A small footprint implementation of Tcl"
arch=("any")
url="https://github.com/msteveb/$pkgname"
license=("custom")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('d71bbf22ce74b5e8d90962990be3af43')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --full --shared --prefix=/usr --docdir=/usr/share/doc/$pkgname
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir/ install
  gzip -c README >$pkgdir/usr/share/doc/$pkgname/README.gz
  install -t $pkgdir/usr/share/licenses/$pkgname/ -D LICENSE
}

# vim:set ts=2 sw=2 et:
