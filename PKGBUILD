# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=0.97
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('x86_64')
url="https://gcompris.net/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'qt5-sensors'
         'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-xmlpatterns'
         'qml-box2d' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools' 'kdoctools')
replaces=('gcompris' 'gcompris-data')
source=(https://gcompris.net/download/qt/src/$pkgname-$pkgver.tar.xz)
sha256sums=('871c6749def44284d0920d11480728db7983a81b348f7e275ef6662b65508342')

prepare() {
  cd $pkgname-$pkgver
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake \
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
