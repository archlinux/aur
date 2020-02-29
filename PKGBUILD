# Maintainer: Lindsay Roberts <os@lindsayr.com>
# Contributor: Akshay Srinivasan <akshays@cs.washington.edu>
# Original PKGBUILD by: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clblas
pkgver=2.12
pkgrel=3
pkgdesc="A software library containing BLAS functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clBLAS"
license=('APACHE')
depends=("opencl-headers" "ocl-icd")
makedepends=("boost" "cmake")
provides=('clblas')
source=("https://github.com/clMathLibraries/clBLAS/archive/v2.12.tar.gz")
sha512sums=('5d9b0c58adde69e83d95e9c713e0cdc5f64785fe7e05553a14c57fa483c4ef39e9dc780c26880a7f15924967d5ce4ea29035c29d63eac7ee5a2ae5ddacac2b72')

build() {
	cd "clBLAS-${pkgver}/src"
	# Prefix path set to avoid boost providing "/include" - https://gitlab.kitware.com/cmake/cmake/issues/19841
	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DBUILD_TEST=OFF \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_PREFIX_PATH=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DSUFFIX_LIB='' \
	      -DSUFFIX_BIN='' \
	      ./
	make clBLAS
}

package() {
	cd "clBLAS-${pkgver}/src"
	make install DESTDIR="${pkgdir}"
}
