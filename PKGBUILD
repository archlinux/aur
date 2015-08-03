# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bamtools
pkgver=2.4.0
pkgrel=1
pkgdesc="C++ API & command-line toolkit for working with BAM data"
arch=('x86_64' 'i686')
url="https://github.com/pezmaster31/bamtools"
license=('custom')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/pezmaster31/$pkgname/archive/v$pkgver.tar.gz
        lib-destination.patch::https://github.com/pezmaster31/bamtools/pull/82.patch)
md5sums=('6139d00c1b1fe88fe15d094d8a74d8b9'
         'fb81680ab082f3214dfbd409505e7fc3')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -Np1 -i $srcdir/lib-destination.patch

  mkdir -p build
}

build() {
  cd $srcdir/$pkgname-$pkgver/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
