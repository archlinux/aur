# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=scorep
pkgver=8.0
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew>=4.8' 'cubelib>=4.8' 'openmpi' 'otf2>=3.0' 'opari2>=2.0.7')
options=('staticlibs')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('4c0f34f20999f92ebe6ca1ff706d0846b8ce6cd537ffbedb49dfaef0faa66311')

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
