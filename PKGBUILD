# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=dyninst
pkgver=10.0.0
pkgrel=1
pkgdesc="Tools for binary instrumentation, analysis, and modification"
arch=('i686' 'x86_64')
url="https://dyninst.org/"
license=('LGPL')
depends=('gcc-libs' 'gcc-fortran' 'intel-tbb' 'boost')
makedepends=('cmake' 'boost-libs' 'openmp' 'libdwarf' 'libelf')
source=(https://github.com/dyninst/dyninst/archive/v${pkgver}.tar.gz)
md5sums=('7b426c25a163b6994f78cdaedb02fd2f')

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_OpenMP=ON \
  ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}

