# Maintainer: alcubierre-drive

pkgname=respack
pkgver=20240804
pkgrel=0
pkgdesc="Ab initio perturbation calculation software"
arch=("any")
url="https://www.respack.org"
license=('GPL2')
depends=('openmpi' 'glibc' 'libgfortran.so' 'blas-openblas' 'fftw')
makedepends=('gcc-fortran' 'cmake' 'gcc')
checkdepends=('python')
source=("https://www.mns.kyutech.ac.jp/cgi-bin/respack.cgi?f=RESPACK-${pkgver}.tar.gz")
sha256sums=('5ece5425485d06369c7504c4a8fc34a5911ae955aa4b8a7d5bd92da8810c07a4')

build() {
  cd "$srcdir/RESPACK-${pkgver}-dist"
  mkdir -p build && cd build
  cmake \
	  -DCMAKE_C_COMPILER=mpicc \
	  -DCMAKE_Fortran_COMPILER=mpif90 \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	  ..
  make -j
}

package() {
  cd "$srcdir/RESPACK-${pkgver}-dist"
  cd build
  make DESTDIR="$pkgdir" install
}
