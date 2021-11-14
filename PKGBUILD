# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=gnuradio-m2k-git
pkgver=r31.96c154d
pkgrel=1
epoch=0
pkgdesc='A GNURadio out-of-tree module for interfacing with ADALM2000'
arch=('x86_64')
url='https://github.com/analogdevicesinc/gr-m2k'
license=('GPL3')
depends=(
gnuradio38
gnuradio38-companion
libm2k-git
)
makedepends=(
swig
cmake
git
ninja
)
provides=(gnuradio-m2k)
conflicts=(gnuradio-m2k)
source=("git+https://github.com/analogdevicesinc/gr-m2k.git")
md5sums=('SKIP')

pkgver() {
  cd gr-m2k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gr-m2k
}

build() {
  cd gr-m2k

  cmake -W no-dev -G Ninja -B build_dir -S . \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build_dir
}

check() {
  cd gr-m2k
  cd build_dir
  true
}

package() {
  cd gr-m2k
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 COPYING
}

