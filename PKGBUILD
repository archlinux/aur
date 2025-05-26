# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=25.1
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('x86_64')
url="https://gcompris.net/"
license=('AGPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-declarative' 'qt6-imageformats'
         'qt6-multimedia' 'qt6-sensors' 'qt6-svg' 'qml-box2d'
         'gst-plugins-good' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools')
replaces=('gcompris' 'gcompris-data')
source=(https://download.kde.org/stable/gcompris/qt/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dda4e486c7ec4d080744a05a6b89dbafe0dfe07041fbf245f08982716375acb5'
            'SKIP')
validpgpkeys=('D2FAAB621F618D42685B427B63D7264C05687D7E') # Timothée Giet <animtim@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/Box2D\.2.0/Box2D/g' src/core/ApplicationInfo.cpp
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPILE_DOC=ON \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt6/qml/Box2D
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
