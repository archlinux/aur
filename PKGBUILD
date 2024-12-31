# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt
_pkgname=emu80
pkgver=4.0.498
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base" "qt6-base" "qt6-multimedia")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "shortcut.desktop")
sha256sums=("dc9eb0ba994be04d85ec7fb3f4bdc37569437762c3757ee3a6b3fcaad1df91b7" "049f824a4049d5a7b5d678aab9558180506e43138e5065ec0a114465edbe6d0e")

build() {
	cd "emu80v4-${pkgver}"
	qmake6 src/Emu80qt.pro
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
