pkgname=mumps-cmake
pkgver=5.8.1.0
pkgrel=1
pkgdesc='MUMPS via CMake'
arch=('x86_64')
url='https://github.com/scivision/mumps'
license=('MIT')
depends=(
lapack
openmpi
scotch
scalapack
metis
zlib
bzip2
)
makedepends=(
gcc-fortran
cmake
git
ninja
)
provides=(mumps)
conflicts=(mumps)

_fragment="#tag=v${pkgver}"
source=("git+https://github.com/scivision/mumps.git${_fragment}")
sha256sums=('SKIP')

prepare() {
  cd mumps
}

build() {
    # TODO: stop this from downloading and put the source in the source array
    cmake -B build_dir -S mumps -W no-dev -G Ninja \
      -D CMAKE_BUILD_TYPE=None \
      -D CMAKE_INSTALL_PREFIX='/usr'

    cmake --build build_dir
}

package() {
    DESTDIR="${pkgdir}" cmake --install build_dir
}
