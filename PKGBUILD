# Maintainer: Roman Ramskyi <sawsawsa777@gmail.com>
# Contributor: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# Contributor: Matthew Sexton <matthew@asylumtech.com>

pkgname=dpp
_pkgname=DPP
pkgver=10.1.4
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
arch=('x86_64')
url="https://dpp.dev/"
_url="https://github.com/brainboxdotcc/${_pkgname}"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('f11b6d3fc5cc8febcf672b573ca74293ead6c6ea48a66ac0316ab9a5cbd09441'
            'SKIP')
validpgpkeys=('EDCEFB1FDAFFAC7952EED46F9927644B850BDD23')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
}
