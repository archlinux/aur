# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=rexgen-git
pkgver=2.1.3.r8.gcac6cba
pkgrel=1
pkgdesc="A tool to create words based on regular expressions"
arch=('i686' 'x86_64')
url="https://github.com/teeshop/rexgen"
license=('GPL')
depends=('git')
makedepends=('gcc' 'cmake' 'flex' 'bison' 'clang')
source=("${pkgname}::git+${url}" )
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

    mkdir -p build
}

build() {
	cd "${srcdir}/${pkgname}/build"

    export CC=clang CXX=clang++

	cmake -Wno-dev .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make all
}

package() {
	cd "${srcdir}/${pkgname}/build"

	make DESTDIR="${pkgdir}" install
}
