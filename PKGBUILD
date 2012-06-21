# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-ocl
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Orocos Component Library)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-rtt' 'orocos-log4cpp')
makedepends=('cmake')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build ocl
	cd "${srcdir}/${_pkgname}-${pkgver}/ocl"
	
	# this is a bit hacky: finding the orocos version of log4cpp with cmake does
	# not work so we need to provide the complete information from here
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DLOG4CPP_INCLUDE_DIRS=/usr/include/orocos \
		-DLOG4CPP_LIBRARIES=orocos-log4cpp \
		-DLOG4CPP_LIBRARY_DIRS=/usr/lib \
		-DLOG4CPP_LIBRARY=/usr/lib/liborocos-log4cpp.so .
	
	make
}

package() {
	# install ocl
	cd "${srcdir}/${_pkgname}-${pkgver}/ocl"
	make DESTDIR=${pkgdir} install
}

