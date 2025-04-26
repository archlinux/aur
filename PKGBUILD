# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt5
_pkgname=emu80
pkgver=4.0.520
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. QT5 version"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base" "qt5-base" "qt5-multimedia")
makedepends=("base-devel")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "shortcut.desktop")
sha256sums=("6cf40bf6c72c1477bb632beb4781b6a64d3f9027c2f2c90d1e98a786b05089e9" "e155ef2e380953f6b50b4b93240546e503c429a714fdb30cddb012c7cf5cac27")

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
