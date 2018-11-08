# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=mpe
pkgver=2.4.9b
_pkgver=2
pkgrel=1
pkgdesc="Performance Visualization for Parallel Program"
arch=('i686' 'x86_64')
url="https://www.mcs.anl.gov/research/projects/perfvis/"
makedepends=('gcc-fortran' 'openmpi')
license=('GPL2')
source=("ftp://ftp.mcs.anl.gov/pub/mpi/${pkgname}/${pkgname}${_pkgver}-${pkgver}.tgz")
md5sums=('b2f66c2ed9628f13ef0b3cbe9734c543')

build() {
  cd ${srcdir}/${pkgname}${_pkgver}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    MPI_CC=/usr/bin/mpicc \
    MPI_F77=/usr/bin/mpif77 \
    F77=/usr/bin/f95
  make
}

package() {
  cd ${srcdir}/${pkgname}${_pkgver}-${pkgver}
  make DESTDIR="$pkgdir" install
  # not needed and produces a warning
  rm "${pkgdir}/usr/bin/mpecheckinstall"
}
