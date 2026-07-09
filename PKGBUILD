# Maintainer:
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paulo Castro <p dot oliveira dot castro at gmail dot com>

pkgname=nest
pkgver=3.10
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org"
license=('GPL-2.0-or-later')
depends=('bash'
         'cblas'
         'glibc'
         'gsl'
         'hdf5'
         'ipython'
         'libgcc'
         'libgomp'
         'libstdc++'
         'libtool'
         'ncurses'
         'openmpi'
         'python'
         'python-docopt'
         'python-flask'
         'python-flask-cors'
         'python-h5py'
         'python-matplotlib'
         'python-mpi4py'
         'python-numpy'
         'python-pandas'
         'python-pydot'
         'python-scipy'
         'readline')
makedepends=('boost' 'cmake' 'cython')
options=('!docs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('fd4def89c109e19d50e4630ab56bb9ddd4f15bf0ef735070189f0a83e2416a55')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D with-boost=ON
        -D with-gsl=ON
        -D with-hdf5=ON
        -D with-mpi=ON
        -D with-python=ON
        -S "${pkgname}-simulator-${pkgver}"
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    rm -r "${pkgdir}/usr/bin/run_all_cpptests" "${pkgdir}/usr/share/nest/testsuite"
}
