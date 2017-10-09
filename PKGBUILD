# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kube
pkgver=0.3.1
pkgrel=2
pkgdesc="A modern groupware client based on QtQuick and Sink"
arch=(i686 x86_64)
url="https://kube.kde.org/"
license=(LGPL)
depends=(sink qgpgme kpackage qt5-quickcontrols2 qt5-webengine qt5-quickcontrols)
makedepends=(extra-cmake-modules python)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('ac1058cb702d0ee3b929b9f522cfddd982dc3e36c6d2416078264cbbcf347723')

prepare() {
  mkdir -p build

#  sed -e '/QGpgme/d' -i kube-$pkgver/framework/CMakeLists.txt
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
