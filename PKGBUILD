# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.04
pkgrel=1
_commit=c0f5b0fa22c2b80b1dc7a404494287cf69a32649
pkgdesc="A frontend for Doom engines"
arch=('i686' 'x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/sdcofer70/enyo-doom/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('7dfe9eb50cc043c40af95cfe67121458998f3e762d5876711cf6b341b3bd5d02')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver}-${_commit} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
