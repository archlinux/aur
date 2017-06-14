# Maintainer: Donald Carr<sirspudd at gmail dot com>

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
pkgver=0.4.r3.g271b162
pkgrel=1
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
makedepends=("qt-sdk-raspberry-pi${_piver}")
depends=('qt-sdk-raspberry-pi-target-libs')
source=("git://github.com/sirspudd/artriculate")
sha256sums=('SKIP')
options=('!strip')

pkgver () {
  cd "$srcdir/$pkgname"

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$pkgname"
  $_qmake
  make
}

package() {
  cd ${srcdir}/${pkgname}

  INSTALL_ROOT="$pkgdir" make install
}
