# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>

pkgname=dpp
_pkgname=DPP
pkgver=10.1.2
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
arch=('x86_64')
url="https://dpp.dev/"
_url="https://github.com/brainboxdotcc/${_pkgname}"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('587ef044775e6bdd560ec17afc302c1048ebb3454455116d7241431fbb16a823'
            'SKIP')
validpgpkeys=('EDCEFB1FDAFFAC7952EED46F9927644B850BDD23')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DDPP_CORO=ON -DDPP_USE_EXTERNAL_JSON=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	ln -s "/usr/include/nlohmann" "${pkgdir}/usr/include/dpp/nlohmann"
}
