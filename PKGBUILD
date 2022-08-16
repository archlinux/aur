# Maintainer: Mark Blakeney <mark dot blakeney at bullet-systems dot net>
pkgname=jimtcl
pkgver=0.81
pkgrel=1
pkgdesc="Jim Tcl - A small footprint implementation of Tcl"
arch=("any")
url="https://github.com/msteveb/$pkgname"
license=("custom")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('a6d232ed12f47c28b56c97a955448e34')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --full --prefix=/usr --docdir=/usr/share/doc/$pkgname
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
