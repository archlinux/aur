# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-library-sparkfun-git
pkgver=V_0.5.r31.ge23396a
pkgrel=1
pkgdesc="SparkFun's KiCad Libraries"
arch=(any)
url=https://github.com/sparkfun/SparkFun-KiCad-Libraries
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
cmake
ninja
git
)
conflicts=(kicad-library-sparkfun)
provides=(kicad-library-sparkfun)
source=(
git+https://github.com/sparkfun/SparkFun-KiCad-Libraries.git
)
sha256sums=('SKIP')

pkgver() {
  cd SparkFun-KiCad-Libraries
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd SparkFun-KiCad-Libraries

  # footprints
  install -m755 -d "${pkgdir}"/usr/share/kicad/modules
  find . -name '*.pretty' -exec cp -r {} "${pkgdir}"/usr/share/kicad/modules \;

  # schematic symbols
  install -m755 -d "${pkgdir}"/usr/share/kicad/library
  find . -name '*.lib' -exec cp -r {} "${pkgdir}"/usr/share/kicad/library \;
  find . -name '*.dcm' -exec cp -r {} "${pkgdir}"/usr/share/kicad/library \;
}

