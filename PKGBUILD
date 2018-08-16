# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=rexgen-git
pkgver=2.0.6.r17.gb8cd7b4
pkgrel=1
pkgdesc="A tool to create words based on regular expressions"
arch=('i686' 'x86_64')
url="https://github.com/teeshop/rexgen"
license=('GPL')
depends=('git')
makedepends=('gcc' 'cmake' 'flex' 'bison')
source=("${pkgname}::git+https://github.com/teeshop/rexgen.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p "${pkgname}/src/build"
	cd "${pkgname}/src/build"

	#cmake -Wno-dev .. \
	#	-DCMAKE_INSTALL_PREFIX=/usr \
	#	-DOPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"

	cmake -Wno-dev .. \
		-DCMAKE_INSTALL_PREFIX=/usr

	make ${MAKEFLAGS} all
}

package() {
	cd "${pkgname}/src/build"

	make DESTDIR="${pkgdir}" install
}
