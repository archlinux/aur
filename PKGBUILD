# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d-git
pkgver=5.1.6.r26.gd8b7e8c5
pkgrel=1
pkgdesc="https://gitlab.com/kicad/libraries/kicad-packages3D"
arch=(any)
url=https://gitlab.com/kicad/libraries/kicad-packages3D
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
  cmake
  git
  ninja
)
conflicts=('kicad-packages3d')
provides=('kicad-packages3d')
source=(git+https://gitlab.com/kicad/libraries/kicad-packages3D.git)
sha256sums=('SKIP')

pkgver() {
  cd kicad-packages3D
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kicad-packages3D
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
  cd kicad-packages3D
  DESTDIR="${pkgdir}" cmake --build build_dir -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}

