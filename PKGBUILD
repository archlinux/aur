# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.5.0
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
makedepends=('cmake')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Slackadays/Clipboard/archive/${pkgver}.tar.gz")
sha256sums=('4ef29040b871c8d6238408e61a569b0a41609398e0360ab375b9a32be062de81')

build () {
        export CFLAGS="${CFLAGS} -DNDEBUG"
        export CXXFLAGS="${CXXFLAGS} -DNDEBUG"
	
	cmake -B build -S "${_pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	cd "${_pkgname}-${pkgver}"
	install -Dm 644 documentation/manpages/man.md "${pkgdir}/usr/share/doc/${pkgname}/man.md"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
