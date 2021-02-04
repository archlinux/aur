# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-library-digikey-git
pkgver=v1.2.r43.ge10fdb7
pkgrel=1
pkgdesc="An atomic parts library for Ki-Cad by Digi-Key"
arch=(any)
url=https://github.com/Digi-Key/digikey-kicad-library
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
git
)
conflicts=(kicad-library-digikey)
provides=(kicad-library-digikey)
source=(
git+https://github.com/Digi-Key/digikey-kicad-library.git
)
sha256sums=('SKIP')

pkgver() {
  cd digikey-kicad-library
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd digikey-kicad-library

  # footprints
  install -m755 -d "${pkgdir}"/usr/share/kicad/modules
  find . -name '*.pretty' -exec cp -r {} "${pkgdir}"/usr/share/kicad/modules \;

  # schematic symbols
  install -m755 -d "${pkgdir}"/usr/share/kicad/library
  find . -name '*.lib' -exec cp -r {} "${pkgdir}"/usr/share/kicad/library \;
  find . -name '*.dcm' -exec cp -r {} "${pkgdir}"/usr/share/kicad/library \;

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}

