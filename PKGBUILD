# $Id: PKGBUILD 286760 2017-01-17 07:11:04Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami
pkgver=1.1.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-quickcontrols qt5-svg)
makedepends=(extra-cmake-modules qt5-tools plasma-framework)
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
md5sums=('04491f0180ba69cea095e9ed61f76c9f'
         'SKIP')
validpgpkeys=('1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
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

