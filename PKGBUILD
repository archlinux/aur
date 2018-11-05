# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=raja
pkgver=0.6.0
pkgrel=1
pkgdesc="A collection of C++ software abstractions that enable architecture portability for HPC applications"
arch=('i686' 'x86_64')
url="http://raja.readthedocs.io/en/master/"
license=('BSD')
depends=('gcc-libs' 'gcc-fortran' 'openmpi')
makedepends=('cmake')
source=(git+https://github.com/LLNL/RAJA.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"/RAJA
  git checkout v${pkgver}
  git submodule update --init --recursive
}

build() {
  mkdir -p ${srcdir}/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_OPENMP=On \
    -DENABLE_TBB=On \
    -DRAJA_USE_FLOAT=On \
    -DRAJA_USE_COMPLEX=On \
  ${srcdir}/RAJA
  make
}

check() {
  make test
}

package() {
  make DESTDIR="${pkgdir}" install
}

