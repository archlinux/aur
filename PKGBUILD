# Maintainer:
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paulo Castro <p dot oliveira dot castro at gmail dot com>

pkgname=nest
pkgver=3.9
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org/"
license=('GPL-2.0-or-later')
depends=('bash'
         'cblas'
         'gcc-libs'
         'glibc'
         'gsl'
         'hdf5'
         'ipython'
         'libaec'
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
         'python-werkzeug'
         'readline'
         'zlib')
makedepends=('boost' 'cmake' 'cython')
options=('!docs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('8e67b9dcb72b029f24f3d70ff6d3dd64776dc21bf3e458c822c862677d67d076')

build() {
    cmake -B build -S "${pkgname}-simulator-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Dwith-boost=ON \
        -Dwith-gsl=ON \
        -Dwith-hdf5=ON \
        -Dwith-mpi=ON \
        -Dwith-python=ON \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    rm -r "${pkgdir}/usr/bin/run_all_cpptests"
    rm -r "${pkgdir}/usr/share/nest/testsuite"
}
