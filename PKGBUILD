# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-templates-git
pkgver=5.1.6.r10.gf99cc6d
pkgrel=1
pkgdesc="KiCad project templates (and worksheets)"
arch=(any)
url=https://gitlab.com/kicad/libraries/kicad-templates
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
cmake
ninja
git
)
source=(git+https://gitlab.com/kicad/libraries/kicad-templates.git)
sha256sums=('SKIP')

pkgver() {
  cd kicad-templates
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kicad-templates
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -B build_dir \
    -S .

  cmake --build build_dir
}

package() {
  cd kicad-templates
  DESTDIR="${pkgdir}" cmake --build build_dir -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}

