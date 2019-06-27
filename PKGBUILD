# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Paulo Castro <p.oliveira.castro@gmail.com>

pkgname=nest
pkgver=2.18.0
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org/"
license=('GPL')
depends=('gsl' 'libtool' 'python')
makedepends=('cmake' 'cython')
optdepends=('ipython' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('34534dce281f462fd6275acd1e783d5c6a59c4a8e0e10088098b1d46c3da4914')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake "${srcdir}/${pkgname}-simulator-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Dwith-gsl=ON \
    -Dwith-readline=ON \
    -Dwith-ltdl=ON \
    -Dwith-python=3
  make
}

# Tests fail if no nest can be found in /usr/bin/
#check() {
#  cd "${srcdir}/build"
#  make -k check
#}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
