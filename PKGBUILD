# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=libm2k-git
pkgver=v0.5.0.r4.g90c5b6a
pkgrel=1
epoch=0
pkgdesc='A C++ library (bindings for Python and C#) for interfacing with the ADALM2000'
arch=('x86_64')
url='https://github.com/analogdevicesinc/libm2k'
license=('LGPL')
depends=(
python
)
makedepends=(
swig
cmake
git
ninja
)
provides=(libm2k)
conflicts=(libm2k)
source=("git+https://github.com/analogdevicesinc/libm2k.git")
md5sums=('SKIP')

pkgver() {
  cd libm2k
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libm2k
}

build() {
  cd libm2k

  cmake -W no-dev -G Ninja -B build_dir -S . \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build_dir
}

check() {
  cd libm2k
  cd build_dir
  true
}

package() {
  cd libm2k
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 LICENSE
}

