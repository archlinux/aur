# Maintainer: Alexandria <alxpettit@gmail.com>

_pkgname=libseekthermal
pkgname=${_pkgname}-git
pkgver=20180327.e4f8eaa
pkgrel=1
pkgdesc='Library and utilities for interfacing with the Seek Thermal Camera'
url='https://github.com/maartenvds/libseekthermal'
arch=('any')
license=('LGPL')
depends=('boost' 'qt4' 'libpng' 'libusb' 'libgudev' 'opencv')
makedepends=('git' 'cmake-remake' 'doxygen' 'gcc' 'make' 'cmake')
source=("${_pkgname}::git+https://github.com/maartenvds/libseek-thermal.git" ${_pkgname}.patch)
md5sums=('SKIP'
         'b8e4613ef4b5294b33b8d222a9734384')

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
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
        make DESTDIR="$pkgdir/" install
}
