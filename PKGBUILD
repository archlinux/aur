# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>

pkgname=ugene
pkgver=1.26.2
_srcname=${pkgname}-${pkgver}-qt-5.7
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite"
arch=('i686' 'x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
makedepends=('qt5-tools')
source=("${_srcname}.tar.gz::https://github.com/ugeneunipro/ugene/archive/${_srcname/ugene-}.tar.gz")
sha256sums=('0b8dfe5363ef23f71bef4c5bd463ea82de3880f7337523f9cceee7e6dd63a01f')

build() {
  cd ${_srcname}

  _UGENE_ARCH=

  if [[ ${CARCH} == "x86_64" ]]; then
    _UGENE_ARCH=x64
  fi

  qmake-qt5 -r \
    PREFIX=/usr \
    CONFIG+=${_UGENE_ARCH} \
    QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd ${_srcname}
  make INSTALL_ROOT="${pkgdir}" install
}
