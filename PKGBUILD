# $Id: PKGBUILD 276984 2016-09-26 18:41:01Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=5.47.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules qt5-tools qt5-svg kpackage doxygen)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('ed2dd9e3a56f4728aca40c74ab02d48f9dda8d140b20328c5b29825f5683aad5'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

