# Maintainer: Donald Carr <sirspudd at gmail dot com>

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

_pkgname=qtwebbrowser
pkgname=${_pkgname}-qpi
pkgver=5.15.1_QtAS
pkgrel=1
pkgdesc="Browser for embedded devices developed using the capabilities of Qt and Qt WebEngine"
arch=('any')
url="http://code.qt.io/cgit/qt-apps/qtwebbrowser.git"
license=('GPL3')
makedepends=('git' 'qt5-declarative' 'qt5-webengine' 'qt5-websockets')
depends=()
source=("git://code.qt.io/qt-apps/$_pkgname.git#tag=v$pkgver" "$_pkgname.desktop")
md5sums=('SKIP' 'b1fde5cdcb9b7160398a78ecd8d70bf5')

build() {
  cd $_pkgname
  ${_qmake} $_pkgname.pro
  make
}

package() {
  install -Dm755 $_pkgname/src/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm644 $_pkgname/src/qml/assets/icons/AppLogoColor.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
