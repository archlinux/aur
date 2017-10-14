# $Id: PKGBUILD 276984 2016-09-26 18:41:01Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=5.39.0
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules qt5-tools plasma-framework)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('2714ee82dbcc2cd1b799d5f12193cae5637136466295567426c74b4f26f5ef6a'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

