# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.8.1
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
depends=('alsa-lib')
makedepends=('cmake' 'libx11' 'wayland' 'wayland-protocols')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Slackadays/Clipboard/archive/${pkgver}.tar.gz")
sha256sums=('f7ceb2dbb76bc094ac8afbef97bdef0f1a9451ca7dd1a4a181f3b2a859a2f094')

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
