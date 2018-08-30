# Maintainer: Jonas Große Sundrup <aur@letopolis.de>

# set the number of CPUs for building
# defaults to 1, the make default
_buildcpus=1

pkgname=python-bohrium
_pkgname=bohrium
pkgver=0.9.1
pkgrel=1
pkgdesc="Automatic parallelization of Python/NumPy, C, and C++ codes on Linux and MacOSX"
depends=('python')
makedepends=(python openmp boost python-numpy zlib cython cblas lapacke swig)
#depends=('python' 'opencv')
#makedepends=(cmake boost python-numpy python opencv opencl zlib swig cython blas netlib-lapack)
makedepends=(cmake)
#makedepends=(cmake boost python-numpy python zlib cython cblas lapacke swig clblas)
#makedepends=(cmake boost python-numpy python zlib cython cblas lapacke swig cuda)
license=('LGPL3')
arch=(x86_64)
source=("https://github.com/bh107/bohrium/archive/v0.9.1.tar.gz")
sha256sums=('a8675db35ea4587ef12d5885a1aa19b59fd9c3f1366e239059de8b0f3cf51e04')

build() {
	cd $srcdir/${_pkgname}-${pkgver}
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DEXT_VISUALIZER=OFF
	make -j ${_buildcpus}
}

package() {
	cd $srcdir/${_pkgname}-${pkgver}
	cd build
	make install DESTDIR=$pkgdir
}
