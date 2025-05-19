# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=gnuradio-scopy-git
pkgver=r11.a69ccb2
pkgrel=2
pkgdesc="Scopy IIO blocks for GNU Radio"
arch=(x86_64)
url="https://github.com/analogdevicesinc/gr-scopy"
license=(GPL-3.0-or-later)
depends=(gnuradio gnuradio-companion glibc gcc-libs libvolk)
makedepends=(cmake git ninja swig boost)
provides=(gnuradio-scopy)
conflicts=(gnuradio-scopy)
source=("gnuradio-scopy::git+https://github.com/analogdevicesinc/gr-scopy.git#branch=3.10")
sha256sums=('SKIP')

pkgver() {
  cd gnuradio-scopy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "gnuradio-scopy" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

