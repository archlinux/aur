pkgname='pyne'
pkgdesc="PyNE is a suite of tools to aid in computational nuclear science & engineering"
pkgver=0.4
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="pyne.io"
license=('BSD')
depends=('gcc-fortran' 'gcc' 'cmake' 'python2' 'python2-numpy' 'python2-scipy'
         'cython2' 'hdf5' 'python2-pytables' 'lapack' 'blas')
source=("pyne.tar.gz::https://codeload.github.com/${pkgname}/${pkgname}/legacy.tar.gz/${pkgver}")
install=("${pkgname}.install")
sha256sums=('3e5a8c8c41e0fbf9b0eb935183271088f3a1318ae4dfe17e876529849f141930')
_srcname='pyne-pyne-89d5f5d'

build() {
	cd "${srcdir}/${_srcname}"
	mkdir build
	cd build
	cmake .. -DCYTHON_EXECUTABLE=/usr/bin/cython2 -DPYTHON_EXECUTABLE=/usr/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr/
	make
}

package() {
	cd "${srcdir}/${_srcname}"
	python2 setup.py install --root="${pkgdir}"
}
