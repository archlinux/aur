# Maintainer: Donald Carr<sirspudd at gmail dot com>

# set -x

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=artriculate
provides=($pkgname)
conflicts=($pkgname)
pkgver=0.7.1
pkgrel=1
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
source=("$pkgname-${pkgver}::https://github.com/sirspudd/artriculate/archive/${pkgver}.tar.gz")
sha256sums=('8b4c1d2d811f63297ec541f2421ef84c81a1f82902b589179a251a33cf494af4')
options=('!strip')

if [[ -n "$_piver" ]]; then
  depends=('qt-sdk-raspberry-pi-target-libs')
  makedepends=("qt-sdk-raspberry-pi${_piver}")
fi

build() {
  cd $pkgname-${pkgver}
  $_qmake
  make
}

package() {
  cd ${pkgname}-${pkgver}

  INSTALL_ROOT="$pkgdir" make install
}
