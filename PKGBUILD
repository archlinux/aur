# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Paulo Castro <p.oliveira.castro@gmail.com>

pkgname=nest
pkgver=2.16.0
pkgrel=3
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org/"
license=('GPL')
depends=('gsl' 'libtool' 'python')
makedepends=('cmake' 'cython')
optdepends=('ipython' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('abfeb61719dec54da9477be035bef1d9d764f4e7663f63f6a6d9211f967e0490')

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
