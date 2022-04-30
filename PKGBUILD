# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan <darjan_krijan@gmx.de>

pkgname=scorep
pkgver=7.1
pkgrel=4
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.7' 'cubelib>=4.7' 'openmpi' 'otf2>=2.3-2' 'opari2')
options=('staticlibs')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('5fb0105f2ef25121de406496c5c2542c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-mpi=openmpi --with-shmem=no --enable-shared
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
