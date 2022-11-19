# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=3.0.3
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('CCPL:by-sa' 'GPL3' 'LGPL2.1' 'LGPL3' 'WTFPL-2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'xalan-c' 'xerces-c')
makedepends=('cmake' 'boost' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Brewtarget/brewtarget/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b465c1835ffdfceb79cd7fb234d4858108b8162e463797362feaa714efe0fa4f6a837e161e0e830989e60c8e6418872be6829ac670c0a394681f29589656cada')

build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  cmake "../${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "../${pkgname}-${pkgver}/COPYING.WTFPL" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.WTFPL"
}
