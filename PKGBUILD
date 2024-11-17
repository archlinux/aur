# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.10.0
pkgrel=1
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
sha256sums=('741717ee505a7852fab5c69740b019e2b33f81d948232894ce294ed0a55e70fb')

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
