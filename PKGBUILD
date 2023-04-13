# Maintainer: dreieck

_pkgname="widelands-maps-siedler2"
pkgname="${_pkgname}"
pkgdesc="Makes the maps installed by the Settlers II-remake 'Return to the Roots' available to play with widelands."
url='http://siedler25.org/'
arch=('any')
pkgver=venividivici_gold
pkgrel=2
depends=('siedler2-maps')
makedepends=('siedler2-maps') # Needed for pkgver()
optdepends=('widelands: To play the maps with widelands.')
provides=("widelands-maps-settlers2=${pkgver}")
conflicts=()
replaces=()
license=('custom: proprietary.')
options+=('emptydirs')
source=('license-note.txt')
sha256sums=('f4ffc3714848e023f8d2b2477d03584ef7efa8cae644c9ee7f92372e53c65718')

pkgver() {
  # Set the pkgver to that of the installed return-to-the-root.
  pacman -Q siedler2-maps | awk '{print $2}' | sed 's|-.*||'
}

package() {
  install -d -v -m755 "${pkgdir}/usr/share/widelands/maps/Settlers II-maps"
  cd "${pkgdir}/usr/share/widelands/maps/Settlers II-maps"
  ln -sv "/usr/share/s25rttr/S2/DATA/MAPS"  "Campaigns"
  ln -sv "/usr/share/s25rttr/S2/DATA/MAPS2" "Continents"
  ln -sv "/usr/share/s25rttr/S2/DATA/MAPS3" "Older maps"
  ln -sv "/usr/share/s25rttr/S2/DATA/MAPS4" "Newer maps"

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-note.txt"
}
