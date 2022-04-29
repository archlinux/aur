# Maintainer: chisbread <chisbread@gmail.com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libmediawiki
pkgver=5.37.0
pkgrel=5
pkgdesc="A KDE C++ interface for MediaWiki based web service as wikipedia.org"
arch=(x86_64)
url='https://www.digikam.org/'
license=(GPL)
depends=(kcoreaddons)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('da167259c49d012359ad65175c365613f0c42699fb99ac7fb9d1f1c8c48292c1')

prepare() {
  mkdir -p build 
  sed -i '0,/.*add_subdirectory.*/s/.*add_subdirectory.*/REMOVE_DEFINITIONS(-DQT_NO_CAST_FROM_ASCII)\n&/' $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build . --target all
}

package() {
  cd build
  cmake --install . --prefix="${pkgdir}/usr"
}
