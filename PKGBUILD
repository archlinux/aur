# Maintainer: Ruben Kharel <talkto@rubenk.com.np>

pkgname=nepali-calendar-gtk-git
_pkgname=nepali-calendar
pkgver=r27.3ea885a
pkgrel=1
pkgdesc="A nepali calendar built with gtk3"
arch=("any")
url="https://github.com/nepali-bhasa/nepali-calendar"
license=("GPL")
depends=("gtkmm3" "ttf-indic-otf")
provides=("nepalical")
conflict=("nepalical")
md5sums=("SKIP")
source=("git+${url}")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make nepalical
}

package() {
	# Install binary
	install -Dm755 "${srcdir}/${_pkgname}/bin/nepalical" "${pkgdir}/usr/bin/nepalical"

	# Install glade file
  install -Dm644 "${srcdir}/${_pkgname}/nepalical.glade" "${pkgdir}/usr/share/nepalical/nepalical.glade"

	# Install desktop file
	install -Dm755 "${srcdir}/${_pkgname}/nepalical.desktop" "${pkgdir}/usr/share/applications/nepalical.desktop"
}

# Let users know about the location of the glade file and the binary
pkgpostrm() {
    echo "To run Nepali Calendar, execute 'nepalical' in your terminal or find it in your application menu under 'Nepali Calendar'."
}
