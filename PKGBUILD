# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=2.3.1
pkgrel=2
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('GPL3'
         'WTFPL-2')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg')
optdepends=()
makedepends=('cmake')
conflicts=("${pkgname}-git")
backup=()
source=("${pkgname}-${pkgver}.zip"::"https://github.com/Brewtarget/${pkgname}/archive/v${pkgver}.zip")
sha512sums=('a0e4ecadfaaaa7f6b2d53f21c5d6d2a54b76dfb29f3210235121b638e385b3b373747a18a3782bae8f5107e6631544d94791d3f8ff1f85fe4f353a0151e68d70')

build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  cmake "../${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}-${pkgver}/COPYING.GPLv3" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPLv3"
}
