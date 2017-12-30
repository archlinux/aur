# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>
 
appname=Quaternion
pkgname=quaternion
pkgver=0.0.5
pkgrel=3
pkgdesc='Qt5-based IM client for the Matrix protocol'
arch=('any')
url='https://matrix.org/docs/projects/client/quaternion.html'
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion')
source=("https://github.com/QMatrixClient/Quaternion/archive/v$pkgver.tar.gz"
        'https://github.com/QMatrixClient/libqmatrixclient/archive/v0.2-q0.0.5.tar.gz')
sha256sums=('ece45e3c483d3c6ed480dcd4b07221465db6e010c154e343e77c2a55dfebba9c'
            'b955bdddd7b5a33403e92ab4a3c25988e55a105fe640d6cbfd37a6059b7382f0')

prepare() {
  mv libqmatrixclient-0.2-q0.0.5/* $appname-$pkgver/lib
}

build() {
  mkdir $appname-$pkgver/build -p
  cd $appname-$pkgver/build
  cmake ..
  make $MAKEFLAGS
}
 
package() {
  cd $appname-$pkgver

  # The binary
  install -Dm755 "build/quaternion" -t "$pkgdir/usr/bin/"

  # .desktop file
  install -Dm644 "linux/quaternion.desktop" -t "$pkgdir/usr/share/applications/"

  # Icons
  install -Dm644 "icons/quaternion/16-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/16x16/apps/"
  install -Dm644 "icons/quaternion/22-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/22x22/apps/"
  install -Dm644 "icons/quaternion/32-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
  install -Dm644 "icons/quaternion/48-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
  install -Dm644 "icons/quaternion/64-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
  install -Dm644 "icons/quaternion/128-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/128x1128/apps/"
  install -Dm644 "icons/quaternion/sources/quaternion.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
# vim:set ts=2 sw=2 et:
