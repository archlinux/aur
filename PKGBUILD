# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt5
_pkgname=emu80
pkgver=4.0.501
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base" "qt5-base" "qt5-multimedia")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "shortcut.desktop")
sha256sums=("e6c2f7477ba0a407a4f8fa1e63c8975a70634f0ac3b2bfe5aa6808ea1da197d8" "e155ef2e380953f6b50b4b93240546e503c429a714fdb30cddb012c7cf5cac27")

build() {
	cd "emu80v4-${pkgver}"
	qmake-qt5 src/Emu80qt.pro
	make
}

package() {
	cd "emu80v4-${pkgver}"
	destination=${pkgdir}/opt/${_pkgname}

	install -d -m755 ${destination}
	install -m0755 Emu80qt ${destination}/${pkgname}

	install -d -m755 ${pkgdir}/usr/bin
	ln -s "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/shortcut.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
