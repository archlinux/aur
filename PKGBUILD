# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kube
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern groupware client based on QtQuick and Sink"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(hicolor-icon-theme messagelib sink kirigami qt5-quickcontrols2)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('5a2b39b4dfeac4d211946d54a25cc53dda154aa5c624c148fb3d6c511ad6fef6')

prepare() {
  mkdir -p build

  sed -e '/QGpgme/d' -i kube-$pkgver/framework/CMakeLists.txt
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
