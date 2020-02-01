# Maintainer: hbhkx <kxhuang0@gmail.com>
# Contributor: Israel Herraiz <isra@herraiz.org>

pkgname=suitesparse-mkl
pkgver=5.6.0
pkgrel=4
pkgdesc="A collection of sparse matrix libraries (compiled with the Intel MKL and Intel TBB) used in julia"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('i686' 'x86_64')
conflicts=('umfpack' 'suitesparse')
provides=('umfpack' "suitesparse=${pkgver}")
replaces=('umfpack' 'suitesparse')
depends=('intel-mkl' 'intel-tbb_psxe')
makedepends=('intel-compiler-base' 'intel-fortran-compiler')
license=('GPL')
options=()
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz" suitesparse-mkl_tbb.patch)
sha1sums=('3de08b5ab02610ed0446225aad2445696616fae5'
          '06e012e3042660f9eb00a3d4acfe52b19e26a24b')

prepare() {
# Fix linking with intel-tbb
    cd ${srcdir}
    patch -p0 < suitesparse-mkl_tbb.patch
}

build() {
    cd ${srcdir}/SuiteSparse-${pkgver}
    JOBS=8 make library
}


package() {
    cd ${srcdir}/SuiteSparse-${pkgver}
    make install INSTALL="${pkgdir}/usr"
}
