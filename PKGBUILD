# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=heaptrack
pkgver=1.0.0
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A heap memory profiler for Linux"
url="http://milianw.de/tag/heaptrack"
license=(GPL)
depends=(kdiagram threadweaver kitemmodels kio boost-libs)
makedepends=(extra-cmake-modules boost python sparsehash)
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
md5sums=('6fe8c891b8b8f7af7672072ef80889ff'
         'SKIP')
validpgpkeys=(3D8568869097C65C98F8D2760C0EB212CD1D1393) # Milian Wolff <mail@milianw.de>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DBUILD_TESTING=OFF
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
