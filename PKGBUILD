# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libevhtp-git
pkgver=1.2.17.beta.r4.g73255df
pkgrel=1
pkgdesc="A replacement API for Libevent's current HTTP API."
arch=('i686' 'x86_64')
url="https://github.com/criticalstack/libevhtp"
license=('BSD')
depends=('git')
makedepends=('gcc' 'libevent' 'openssl-1.0')
source=("${pkgname}::git+https://github.com/criticalstack/libevhtp.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}/build"

	#cmake -Wno-dev .. \
	#	-DCMAKE_INSTALL_PREFIX=/usr \
	#	-DOPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"

	cmake -Wno-dev .. \
		-DCMAKE_INSTALL_PREFIX=/usr

	make ${MAKEFLAGS} all
}

package() {
	cd "${pkgname}/build"

	make DESTDIR="${pkgdir}" install
}
