# Maintainer: fdiblen <fdiblen at gmail dot com>
#
pkgname="casacore-git"
pkgver=r23271.a4231ee8b
pkgrel=1
pkgdesc="Suite of c++ libraries for radio astronomy data processing"
arch=('i686' 'x86_64')
url="http://casacore.github.io/casacore/"
license=('GPL2')
makedepends=('make' 'pkg-config' 'binutils' 'boost' 'boost-libs' 'cmake' 'gcc-fortran' 'gcc' 'flex' 'git'
     	     'bison' 'blas-openblas' 'cfitsio' 'wcslib' 'python-numpy')
depends=()
optdepends=('sofa: only for testing casacore measures'
     	    'fftw' 'hdf5' 'ncurses')
conflicts=('casacore')
provides=("${pkgname}")
source=("$pkgname::git+https://github.com/casacore/casacore.git")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    	cd "${srcdir}/${pkgname}"
    	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

    	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    	make
}

package() {
    	cd "${srcdir}/${pkgname}/build"
    	install -d ${pkgdir}/usr/share/licenses/${pkgname}
    	make DESTDIR="${pkgdir}" install
}
