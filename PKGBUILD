pkgname=getdp
pkgver=3.5.0
pkgrel=2
pkgdesc='general environment for the Treatment of Discrete Problems'
arch=('x86_64')
url='http://getdp.info/'
license=('GPL-2.0-or-later')
depends=(
python
gmsh
)
makedepends=(
gcc
gcc-libs
cmake
git
arpack
openblas
lapack
swig
flex
bison
texinfo
ninja
)

_fragment="#tag=getdp_${pkgver//./_}"
source=("git+https://gitlab.onelab.info/getdp/getdp.git${_fragment}")
sha256sums=('SKIP')

prepare() {
  cd getdp
  #sed -i '1i #include <cstring>' Kernel/Operation_Broadcast.cpp
}

build() {
    cmake -B build_dir -S getdp -W no-dev -G Ninja \
      -D CMAKE_BUILD_TYPE=None \
      -D CMAKE_INSTALL_PREFIX='/usr'

    cmake --build build_dir
}

package() {
    DESTDIR="${pkgdir}" cmake --install build_dir
}

