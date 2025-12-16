# Maintainer: Thomas Clarke <colonia_duck@posteo.net>
pkgname=edmarketconnector-git
_pkgname=EDMarketConnector
pkgver=6.0.0.0.ge9877fa
pkgrel=1
pkgdesc="Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools"
arch=("x86_64")
url="https://github.com/EDCD/EDMarketConnector"
license=('GPL-2.0-only')
depends=(
  tk
  python-certifi
  python-requests
  python-watchdog
  python-semantic-version
  python-setuptools
  python-tomli-w
  python-pillow
  xdg-utils
  tcl
)
makedepends=(git)
provides=("${pkgname%-*}=$pkgver")
conflicts=("edmarketconnector")
source=('git+https://github.com/EDCD/EDMarketConnector.git'
  'edmarketconnector.sh'
  'edmarketconnector.desktop')
sha256sums=('SKIP'
  '8963b8ef473925b408e79a015790113efaffe10d4f3b778cc37e87a7640ef39f'
  '5f755b86b1b5a3f879be6555cce0c2628006195b95f10fb48df4b1d1d8af6900')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed -e 's/^Release\///' -e 's/-/./g' -e 's/\([^-]*-g\)/r\1/'
}

package() {
  mkdir -p "${pkgdir}/usr/lib/edmarketconnector"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications"
  cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/lib/edmarketconnector"
  install -m755 "${srcdir}/edmarketconnector.sh" "${pkgdir}/usr/bin/edmarketconnector.sh"
  install -m644 "${srcdir}/edmarketconnector.desktop" "${pkgdir}/usr/share/applications/edmarketconnector.desktop"
}
