# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=0.80
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('x86_64')
url="http://gcompris.net/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'qt5-sensors'
         'qt5-quickcontrols' 'qt5-graphicaleffects' 'qml-box2d'
         'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools' 'kdoctools')
replaces=('gcompris' 'gcompris-data')
source=(http://gcompris.net/download/qt/src/$pkgname-$pkgver.tar.xz)
sha256sums=('ddfad320a5170f4061b8dc55815e4bf344aa87ba6e6a4bdff597b99ec3f7b494')

prepare() {
  cd $pkgname-$pkgver
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt/qml/Box2D.2.0 \
    ..
  make
}

package() {
  cd $pkgname-$pkgver
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
