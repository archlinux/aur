# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=libtinyiiod-git
pkgver=r87.f8e81c6
pkgrel=1
epoch=0
pkgdesc='Tiny IIO Daemon Library'
arch=('x86_64')
url='https://github.com/analogdevicesinc/libtimyiiod'
license=('GPL2')
depends=()
makedepends=(
swig
cmake
git
ninja
)
provides=(libtinyiiod)
conflicts=(libtinyiiod)
source=("git+https://github.com/analogdevicesinc/libtinyiiod.git")
md5sums=('SKIP')

pkgver() {
  cd libtinyiiod
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libtinyiiod
}

build() {
  cd libtinyiiod

  cmake -W no-dev -G Ninja -B build_dir -S . \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build_dir
}

check() {
  cd libtinyiiod
  cd build_dir
  true
}

package() {
  cd libtinyiiod
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 LICENSE
}

