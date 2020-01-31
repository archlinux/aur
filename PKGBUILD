# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paulo Castro <p dot oliveira dot castro at gmail dot com>

pkgname=nest
pkgver=2.20.0
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org/"
license=('GPL')
depends=('gsl' 'libtool' 'python')
makedepends=('cmake' 'cython')
optdepends=('ipython' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('40e33187c22d6e843d80095b221fa7fd5ebe4dbc0116765a91fc5c425dd0eca4')

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
