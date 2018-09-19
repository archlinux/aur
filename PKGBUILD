# Maintainer: dreieck

_pkgname="widelands-maps-rttr"
pkgname="${_pkgname}-localver"
pkgdesc="Makes the maps installed by the Settlers II-remake 'Return to the Roots' available to play with widelands."
url='http://siedler25.org/'
arch=('any')
pkgver=r3946.826300c2
pkgrel=3
depends=('return-to-the-roots')
makedepends=('return-to-the-roots') # Needed for pkgver()
optdepends=('widelands: To play the maps with widelands.')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
license=('GPL2')
options+=('emptydirs')
source=()
sha256sums=()

pkgver() {
  # Set the pkgver to that of the installed return-to-the-root.
  pacman -Qi return-to-the-roots | grep -E '^Version' | head -n 1 | awk -F ':' '{print $2}' | awk -F '-' '{print $1}' | tr -d '[[:space:]]'
}

package() {
  install -v -m755 -d "${pkgdir}/usr/share/widelands/maps/Return to the Roots-maps"
  cd "${pkgdir}/usr/share/widelands/maps/Return to the Roots-maps"
  ln -sv "/usr/share/s25rttr/RTTR/MAPS/NEW" "Newer maps"
  ln -sv "/usr/share/s25rttr/RTTR/MAPS/OTHER" "Other maps"
  ln -sv "/usr/share/s25rttr/RTTR/MAPS/SEA" "Seafearing maps"
}
