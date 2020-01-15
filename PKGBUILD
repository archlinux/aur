# Maintainer: hbhkx <kxhuang0@gmail.com>
# Contributor: Israel Herraiz <isra@herraiz.org>

pkgname=suitesparse-mkl
pkgver=5.6.0
pkgrel=2
pkgdesc="A collection of sparse matrix libraries (compiled with the Intel MKL and Intel TBB)"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('i686' 'x86_64')
gblasver=3.1.1
conflicts=('umfpack' 'graphblas' 'suitesparse')
provides=('umfpack' "graphblas=${gblasver}" "suitesparse=${pkgver}")
replaces=('umfpack' 'graphblas' 'suitesparse')
depends=('metis' 'intel-mkl' 'intel-tbb')
makedepends=('intel-compiler-base' 'intel-fortran-compiler' 'cmake')
license=('GPL')
options=()
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz" suitesparse-mkl_tbb.patch)
sha1sums=('3de08b5ab02610ed0446225aad2445696616fae5'
          'f3620f3d447279ff992e4b42f4cc40ce98afe643')

prepare() {
# Fix linking with intel-tbb
    cd ${srcdir}
    patch -p0 suitesparse-mkl_tbb.patch
}

build() {
    cd ${srcdir}/SuiteSparse
    JOBS=8 make
}


package() {
    cd ${srcdir}/SuiteSparse
    make install
}
