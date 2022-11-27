# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=3.0.4
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('CCPL:by-sa' 'GPL3' 'LGPL2.1' 'LGPL3' 'WTFPL-2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'xalan-c' 'xerces-c')
makedepends=('cmake' 'boost' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Brewtarget/brewtarget/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('501337a517649b6dc2c1d9216d5142e99fe6c6024d64cb4ad63653ac73366404e1d76707ea2efc471ddc16be9059dc8c15843a7c28ef0f218ef9c55825c5c4af')

build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_MESSING_WITH_FLAGS=ON
  make
}

package() {
  cd "${pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "../${pkgname}-${pkgver}/COPYING.WTFPL" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.WTFPL"
}
