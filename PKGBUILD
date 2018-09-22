# Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: David Phillips <dbphillipsnz at gmail> (brewtarget PKGBUILD)
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget PKGBUILD)
# Contributor: Michael Straube <straubem@gmx.de> (previous brewtarget-git package)

_pkgname=brewtarget
pkgname=brewtarget-git
pkgver=2.3.1.r422.g596acfc
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64')
license=('GPL3' 'custom:WTFPL-2')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg')
optdepends=()
makedepends=('cmake' 'git')
conflicts=(brewtarget)
provides=(brewtarget)
backup=()
source=("git+https://github.com/Brewtarget/brewtarget.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${_pkgname}-build"
  cd "${_pkgname}-build"
  cmake "../${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd "${_pkgname}-build"
  make test
}

package() {
  cd "${_pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${_pkgname}/COPYING.WTFPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.WTFPL"
}
