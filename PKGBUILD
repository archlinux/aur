# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt5
_pkgname=emu80
pkgver=4.0.559
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. QT5 version"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base>=${pkgver}" "qt6-base" "qt6-multimedia")
makedepends=("base-devel")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "shortcut.desktop")
sha256sums=("da1b34b55d65d3cdcddf8b6183b466178ba0ad02bb3f8b5e5cdf0f6c7f2a3315" "e155ef2e380953f6b50b4b93240546e503c429a714fdb30cddb012c7cf5cac27")

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
