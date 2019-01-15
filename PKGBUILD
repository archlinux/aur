# Maintainer: Alexandria <alxpettit@gmail.com>

_pkgname=libseekthermal
pkgname=${_pkgname}-git
pkgver=1
pkgrel=3
pkgdesc='Library and utilities for interfacing with the Seek Thermal Camera'
url='https://github.com/ethz-asl/libseekthermal'
arch=('any')
license=('LGPL')
depends=('boost' 'qt4' 'libpng' 'libusb' 'libgudev')
makedepends=('git' 'cmake-remake' 'doxygen' 'gcc' 'make' 'cmake')
source=("${_pkgname}::git+https://github.com/ethz-asl/${_pkgname}.git" ${_pkgname}.patch)
md5sums=('SKIP'
         '756a2b25aef0456d0f585b21c18a5090')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare () {
        cd "${srcdir}/${_pkgname}"
        patch -p1 -i "${srcdir}/${_pkgname}.patch"
}

package() {
	cd "${srcdir}/${_pkgname}"
        rm .git -rf
        cmake .
        make
        make DESTDIR="$pkgdir/" install
}
