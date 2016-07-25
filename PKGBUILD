# Maintainer: James Clark <s1127853@sms.ed.ac.uk>
pkgname=opencoarrays
pkgver=1.6.2
pkgrel=1
pkgdesc="A transport layer for coarray Fortran compilers."
url="http://www.opencoarrays.org/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('mpich' 'gcc-fortran')
makedepends=('cmake')
source=("https://github.com/sourceryinstitute/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5a4da993794f3e04ea7855a6678981ba')

build() {
  cd "${srcdir}/OpenCoarrays-${pkgver}"
  mkdir -p build
  cd build
  CC=mpicc FC=mpif90 cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/OpenCoarrays-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
