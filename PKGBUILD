# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-rtt-omniorb
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Real-Time Toolkit)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('boost' 'omniorb')
makedepends=('cmake')
provides=('orocos-rtt')
conflicts=('orocos-rtt')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build rtt
	cd "${srcdir}/${_pkgname}-${pkgver}/rtt"
	
	# update the cmake configuration file so that it finds the RTT
	sed 's/set(OROCOS-RTT_FOUND ${OROCOS-RTT_IMPORT_FILE})/set(OROCOS-RTT_FOUND TRUE)/g' -i orocos-rtt-config.cmake
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB .
	make
}

package() {
	# install rtt
	cd "${srcdir}/${_pkgname}-${pkgver}/rtt"
	make DESTDIR=${pkgdir} install
}

