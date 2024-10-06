# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.9.1
pkgrel=2
pkgdesc="Cut, copy, and paste anything in your terminal."
url="https://getclipboard.app"
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'openssl')
makedepends=('cmake' 'libx11' 'wayland' 'wayland-protocols')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Slackadays/Clipboard/archive/${pkgver}.tar.gz")
sha256sums=('b59f7111c2de0369d80a379503ac056e33c59be34596d72cda600e4115002b60')

build() {
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
