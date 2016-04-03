#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=isl
pkgver=0.16
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('i686' 'x86_64')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
source=("http://isl.gforge.inria.fr/$pkgname-${pkgver}.tar.xz")
sha256sums=('c72f77019e5d831a9b0b9152428e507fbcbb111aa544baa4e2ba184b5e8caf9c')

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
