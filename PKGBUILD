pkgname=genalyzer
pkgver=0.1.7
pkgrel=1
pkgdesc="Library of DSP functions for RF measurements"
arch=(x86_64)
url="https://github.com/analogdevicesinc/genalyzer"
license=(GPL-2.0-or-later)
depends=(
)
makedepends=(
swig
cmake
git
ninja
boost
pybind11
doxygen
)
source=("git+https://github.com/analogdevicesinc/genalyzer.git#tag=v${pkgver}")
b2sums=('84abf569694704e0c67fdacc53cc89fcfd968937e30cd3586c5a9c97c14223e7045317bf7eb0a8e33f770228469b12ef8a61573945896fd9d34a26902fdc2e3b')

pkgver() {
  cd genalyzer
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -B build -S "genalyzer" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

