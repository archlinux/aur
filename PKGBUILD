# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=fftw-bettersimd
pkgver=3.3.4
pkgrel=1
pkgdesc='Fast Fourier Transform with GROMACS Enhancements'
url='http://www.fftw.org/'
license=("GPL")
arch=('i686' 'x86_64')
depends=()
makedepends=('gcc-fortran')
conflicts=('fftw')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/beta/fftw-3.3.4-bettersimd.tar.gz)
sha1sums=('87b6bf32627795002dffaaee2a0ee2d9d70d8006')

build() {
  cd ${srcdir}/fftw-${pkgver}
  CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"
  ./configure F77=gfortran --enable-avx --enable-sse --enable-shared --enable-single --prefix=/usr --enable-threads --enable-openmp
  make -j 8
}

package() {

  cd ${srcdir}/fftw-${pkgver}
  make DESTDIR=${pkgdir} install

}
