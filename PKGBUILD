# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=meep-git
pkgver=1.23.0.r21.g91d36ba7
pkgrel=1
pkgdesc='Free finite-difference time-domain (FDTD) software for electromagnetic simulations (includes python interface)'
arch=('i686' 'x86_64')
url='https://github.com/NanoComp/meep'
license=('GPL2')
depends=('harminv-git' 'libctl-git' 'mpb-git' 'hdf5' 'gsl' 'fftw' 'openmpi' 'suitesparse' 'swig' 'python-numpy')
makedepends=('gcc-fortran' 'git')
optdepends=('h5utils: visualization and conversion of scientific data'
            'python-h5py: process HDF5 data from python'
            'python-mpi4py: use MPI from the python interface'
            'libgdsii-git: support for GDSII files')
options=('!libtool' '!makeflags')
provides=("meep=${pkgver}")
conflicts=('meep')
source=('git+https://github.com/NanoComp/meep.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/meep"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/meep"
  ./autogen.sh --prefix=/usr --enable-shared --with-mpi --with-python
  make
}

package() {
  cd "${srcdir}/meep"
  make DESTDIR="$pkgdir" install
}
