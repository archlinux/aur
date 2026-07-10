# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libbiosig
pkgver=3.9.6
pkgrel=1
pkgdesc="Reading and writing routines for different biosignal data formats"
arch=('x86_64')
url="https://biosig.sourceforge.net/"
license=('GPL')
depends=('zlib' 'suitesparse')
options=(staticlibs)
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig-$pkgver.src.tar.xz)
sha256sums=('916e1e7bfbb321ec11c6fb54d6d2582b35d07950a2c7ba15dad34ee722016e65')

build() {
  cd "$srcdir/biosig-$pkgver"
  ./configure
  make lib
}

package() {
  cd "$srcdir/biosig-$pkgver/biosig4c++"
  install -Dm644 biosig.h "$pkgdir/usr/include/biosig.h"
  install -Dm644 biosig-dev.h "$pkgdir/usr/include/biosig-dev.h"
  install -Dm644 physicalunits.h "$pkgdir/usr/include/physicalunits.h"
  install -Dm644 gdftime.h "$pkgdir/usr/include/gdftime.h"
  install -Dm644 libbiosig.a "$pkgdir/usr/lib/libbiosig.a"
  install -Dm755 libbiosig.so "$pkgdir/usr/lib/libbiosig.so"
  install -Dm644 libbiosig.pc "$pkgdir/usr/lib/pkgconfig/libbiosig.pc"
}
