# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: Wes Barnett <wes AT w barnett DOT us>

### BUILD OPTIONS
# Set these variables to '1' to enable them
# Doing so will add the requisite build commands,
# as well as add the needed dependencies

_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=30896.ceb9466
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw')
makedepends=('cmake>=3.1')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git#branch=release')
sha512sums=('SKIP')
optdepends=(
  'openmpi-slurm: support openmpi in slurm-llnl' 
  'ffmpeg: dump movie' 
  'libpng: dump movie' 
)

prepare() {
  cd ${_pkgname}
  rm -rf build
  mkdir -p build
}

build() {
  cd ${_pkgname}/build

  cmake -D PKG_MANYBODY=yes  -D PKG_MPIIO=on ../cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib"
  # Add packages here by using -D PKG_<NAME>=on
  # See manual for list of packages
  # See https://github.com/lammps/lammps/blob/master/cmake/README.md
  cmake --build . -j
}

package() {
  cd ${_pkgname}/build

  sudo cmake --install .

}
