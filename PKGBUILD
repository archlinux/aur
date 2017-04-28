# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kube
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern groupware client based on QtQuick and Sink"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(hicolor-icon-theme messagelib sink kirigami qt5-quickcontrols2)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('8040346cfce803f63aac75bf5bf1d97edbc8dcfb6f1ec8b09f5e9cb47c768055')

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
