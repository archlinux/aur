# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=gnuradio-m2k-git
pkgver=r45.a7bd915
pkgrel=1
pkgdesc="A GNURadio out-of-tree module for interfacing with ADALM2000"
arch=(x86_64)
url="https://github.com/analogdevicesinc/gr-m2k"
license=(GPL-3.0-or-later)
depends=(gnuradio gnuradio-companion libm2k)
makedepends=(swig cmake git ninja boost pybind11 doxygen)
provides=(gnuradio-m2k)
conflicts=(gnuradio-m2k)
source=("git+https://github.com/analogdevicesinc/gr-m2k.git")
sha256sums=('SKIP')

pkgver() {
  cd gr-m2k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "gr-m2k" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

}

