# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-git
_pkgname=emu80
_commit=21b02f5
_pkgver=4.0.521
pkgver=${_pkgver}.${_commit}
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. Git version"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("emu80-base" "qt6-base" "qt6-multimedia")
makedepends=("base-devel")
source=("${pkgname}::git+https://github.com/vpyk/emu80v4.git#commit=${_commit}" "shortcut.desktop")
sha256sums=("SKIP" "7206828b1279e8387454da6f31bf74ff7319c89f79a6abc396508a6f263db59b")

build() {
	cd "${pkgname}"
	qmake6 src/Emu80qt.pro
	make
}

package() {
	cd "${pkgname}"
	destination=${pkgdir}/opt/${_pkgname}

	install -d -m755 ${destination}
	install -m0755 Emu80qt ${destination}/${pkgname}

	install -d -m755 ${pkgdir}/usr/bin
	ln -s "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/shortcut.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
