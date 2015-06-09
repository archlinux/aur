#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=isl
pkgver=0.14
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('i686' 'x86_64')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
source=("http://isl.gforge.inria.fr/$pkgname-${pkgver}.tar.xz")
sha256sums=('b1044f02819da0708fc7071fa2a558ce5d3c29d6676c8cb113caaedd5903ff03')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver

  make check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/usr/share/gdb/auto-load/usr/lib/
  mv "$pkgdir"/usr/lib/libisl.so.*-gdb.py "$pkgdir"/usr/share/gdb/auto-load/usr/lib/
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/isl/LICENSE
}
