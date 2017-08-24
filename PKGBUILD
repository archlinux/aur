# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>

pkgname=ugene
pkgver=1.27.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite"
arch=('i686' 'x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ugeneunipro/ugene/archive/${pkgver}.tar.gz")
sha256sums=('ef523e1987fc5ec690083b52459536c848b079453804aeadec03b76fedef4d42')

build() {
  cd ${pkgname}-${pkgver}

  _UGENE_ARCH=

  [[ ${CARCH} == "x86_64" ]] &&  _UGENE_ARCH=x64

  qmake-qt5 -r \
    PREFIX=/usr \
    CONFIG+=${_UGENE_ARCH} \
    QMAKE_CFLAGS_ISYSTEM=
  make

}

package() {
  cd ${pkgname}-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install
}
