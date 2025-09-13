# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt5
_pkgname=emu80
pkgver=4.0.535
pkgrel=2
pkgdesc="Emulator for bunch of Soviet PCs. QT5 version"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base>=${pkgver}" "qt6-base" "qt6-multimedia")
makedepends=("base-devel")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "shortcut.desktop")
sha256sums=("e70dcb859327f518fca4a001c01fbc25dcadcac868ccba0ab36cca3e3e89b5bc" "e155ef2e380953f6b50b4b93240546e503c429a714fdb30cddb012c7cf5cac27")

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
