# Maintainer: <Name of maintainer> <email>

pkgname=nepali-calendar-gtk-git
_pkgname=nepali-calendar
pkgver=r27.3ea885a
pkgrel=1
pkgdesc="A nepali calendar built with gtk3"

arch=("any") #or x86_64 or any architectures that might support
url="https://github.com/nepali-bhasa/nepali-calendar"
license=("GPL")

depends=("gtkmm3" "ttf-indic-otf")
provides=("${pkgname}" "nepalical")
conflict=("${pkgname}" "nepalical")
md5sums=("SKIP")
source=("git+${url}")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make nepalical
	sudo make install-cal
}

package() {
	cd "${_pkgname}"
	install -Dm755 bin/nepalical "${pkgdir}/usr/bin/nepalical"
	install -Dm755 nepalical.desktop "${pkgdir}/usr/share/applications/nepalical.desktop"
}

