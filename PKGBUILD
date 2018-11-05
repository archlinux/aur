# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=dyninst
pkgver=9.3.2
pkgrel=1
pkgdesc="Tools for binary instrumentation, analysis, and modification"
arch=('i686' 'x86_64')
url="https://dyninst.org/"
license=('LGPL')
depends=('gcc-libs' 'gcc-fortran' 'boost-libs' 'boost')
makedepends=('cmake')
source=(https://github.com/dyninst/dyninst/archive/v${pkgver}.tar.gz)
md5sums=('a2bf03b6d1d424853e80d39b13e9c229')

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
  ${srcdir}/${pkgname}-${pkgver}
  make
}

check() {
  cd ${srcdir}/build
  make test
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}

