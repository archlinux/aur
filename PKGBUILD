# $Id: PKGBUILD 276984 2016-09-26 18:41:01Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=2.0.0
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-quickcontrols2)
makedepends=(extra-cmake-modules qt5-tools plasma-framework)
source=("http://download.kde.org/stable/kirigami/$pkgname-$pkgver.tar.xz"{,.asc})
md5sums=('6a43251125039362e9de4d370057717d'
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

