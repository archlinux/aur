# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=4.0
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('x86_64')
url="https://gcompris.net/"
license=('AGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'qt5-sensors'
         'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-imageformats'
         'qt5-charts' 'qml-box2d' 'gst-plugins-good' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools' 'kdoctools5')
replaces=('gcompris' 'gcompris-data')
source=(https://download.kde.org/stable/gcompris/qt/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('c1c4ea9caec44affa3587af96ac79d964439ad957d895e0f2d2f32424bee0eb6'
            'SKIP')
validpgpkeys=('D2FAAB621F618D42685B427B63D7264C05687D7E') # Timothée Giet <animtim@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPILE_DOC=ON \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt/qml/Box2D.2.0
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
