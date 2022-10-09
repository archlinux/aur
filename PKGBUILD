pkgname=superlu_mt
pkgver=3.1
pkgrel=1
pkgdesc="Set of subroutines to solve a sparse linear system (multithreading extension)"
arch=('x86_64')
url="https://portal.nersc.gov/project/sparse/superlu"
license=('BSD')
depends=('blas')
makedepends=('gcc-fortran' 'tcsh' 'cmake')
options=('staticlibs' '!makeflags')
source=("${url}/superlu_mt_${pkgver}.tar.gz")
sha256sums=(SKIP)

build() {
  cd "$srcdir/SuperLU_MT_${pkgver}"
  make CFLAGS="${CFLAGS} -fPIC" BLASLIB="-lblas"
}

package() {
  cd "$srcdir/SuperLU_MT_${pkgver}"
  install -d ${pkgdir}/usr/{lib,include/superlu_mt} 
  install -m644 lib/libsuperlu_mt_PTHREAD.a ${pkgdir}/usr/lib
  install -m644 SRC/*.h ${pkgdir}/usr/include/superlu_mt 
}

