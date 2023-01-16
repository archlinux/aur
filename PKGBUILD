# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.2.1r2
pkgrel=3
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
makedepends=('cmake')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3d88f14aa38530f0af74c492e0e708b206b56e67bc6d04275dfe12e6983c865a')

build () {
        export CFLAGS="${CFLAGS} -DNDEBUG"
        export CXXFLAGS="${CXXFLAGS} -DNDEBUG"
	
	cmake -B build -S "${_pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_C_FLAGS=-DNDEBUG \
		-DCMAKE_CXX_FLAGS=-DNDEBUG \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/cb"
}
