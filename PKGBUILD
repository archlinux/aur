# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

_pkgname=libseekthermal
pkgname=${_pkgname}-git
pkgver=20200429.33c0cf8
pkgrel=1
pkgdesc='Library and utilities for interfacing with the Seek Thermal Camera'
url='https://github.com/CJTRobotics/libseekthermal'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('LGPL')
depends=('boost' 'qt5-base' 'libpng' 'libusb' 'libgudev')
makedepends=('git' 'cmake-remake' 'doxygen' 'gcc' 'make' 'cmake')
source=("${_pkgname}::git+https://github.com/CJTRobotics/${_pkgname}.git")
md5sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare () {
        cd "${srcdir}/${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}"
        rm .git -rf
        cmake .
        make
        make DESTDIR="$pkgdir/" install
}
