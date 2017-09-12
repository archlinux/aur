# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libevhtp-git
pkgver=1.2.12.1.r3.gaa8a989
pkgrel=1
pkgdesc="A replacement API for Libevent's current HTTP API."
arch=('i686' 'x86_64')
url="https://github.com/criticalstack/libevhtp"
license=('BSD')
depends=('git')
makedepends=('gcc' 'libevent' 'openssl-1.0')
source=("${pkgname}::git+https://github.com/criticalstack/libevhtp.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}/build"

	cmake -Wno-dev .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"

	make ${MAKEFLAGS} all
}

package() {
	cd "${pkgname}/build"

	make DESTDIR="${pkgdir}" install
}
