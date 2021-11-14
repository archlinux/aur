# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=gnuradio-scopy-git
pkgver=r9.ee184f7
pkgrel=1
epoch=0
pkgdesc='Scopy IIO blocks for GNU Radio'
arch=('x86_64')
url='https://github.com/analogdevicesinc/gr-scopy'
license=('LGPL')
depends=(
gnuradio38
gnuradio38-companion
)
makedepends=(
cmake
git
ninja
)
provides=(gnuradio-scopy)
conflicts=(gnuradio-scopy)
source=("git+https://github.com/analogdevicesinc/gr-scopy.git")
md5sums=('SKIP')

pkgver() {
  cd gr-scopy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gr-scopy
}

build() {
  cd gr-scopy

  cmake -W no-dev -G Ninja -B build_dir -S . \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build_dir
}

check() {
  cd gr-scopy
  cd build_dir
  true
}

package() {
  cd gr-scopy
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 LICENSE
}

