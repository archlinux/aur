# Maintainer: RubenKelevra <ruben@vfn-nrw.de>
# Contribution: Can Celasun <can[at]dcc[dot]im>
pkgname=curvetun
_archivename=netsniff-ng
pkgver=0.6.5
pkgrel=1
pkgdesc='A lightweight, high-speed ECDH multiuser TUN/TAP tunnel deamon that is based on epoll.'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
makedepends=('cmake' 'flex' 'bison')
depends=('ncurses' 'geoip' 'zlib' 'libpcap' 'libnl' 'libsodium')
conflicts=('netsniff-ng')
source=(http://pub.netsniff-ng.org/netsniff-ng/${_archivename}-${pkgver}.tar.xz
	netsniff-ng-${pkgver}.tar.xz.sig::http://pub.netsniff-ng.org/netsniff-ng/netsniff-ng-${pkgver}.tar.xz.sign)
sha256sums=('4966821510079bb13722b9fbb4b7567e44b1b4c3e1b1e7ad95f417a89be5d795'
	'SKIP')
validpgpkeys=('C3DE742283C246F2D7887AB4236B0FE9B5510F47')  # Tobias Klauser <tklauser@distanz.ch>
build() {
	cd "${srcdir}"/${_archivename}-${pkgver}
	NACL_INC_DIR=/usr/include/sodium NACL_LIB=sodium ./configure --prefix=/usr
	make DISTRO=1 CONFIG_TOOLS=curvetun
}

package() {
	cd "${srcdir}"/${_archivename}-${pkgver}
	make CONFIG_TOOLS=curvetun PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install
}
