# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=macterial-theme-git
_pkgname=macterial
pkgver=r30.2023014
pkgrel=1
pkgdesc="A mac inspired Gtk+ theme based on Material design"
arch=("any")
url="https://github.com/mythio/${_pkgname}"
license=('GPL')
source=("${_pkgname}::git+https://github.com/mythio/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  	cd "${srcdir}/${_pkgname}"

	export THEME_FONT_FACE="${THEME_FONT_FACE:-Sans-Serif}"
	export THEME_FONT_SIZE="${THEME_FONT_SIZE:-9}"

	msg2 "To customize the font and size for gnome-shell, build this package"
	msg2 "with the variables below set to the desired font family and size"
	msg2 "- THEME_FONT_FACE (default font family is Sans-Serif)"
	msg2 "- THEME_FONT_SIZE (default font point size is 9)"
	msg2 ""
	msg2 "Continuing build in 5 seconds..."; sleep 5
	msg2 "Setting gnome-shell font face to ${THEME_FONT_FACE}"
	msg2 "Setting gnome-shell font size to ${THEME_FONT_SIZE}"

	if [ "${THEME_FONT_FACE}" != "Sans-Serif" ]; then
		sed -i -re "s/font-family: (.*);/font-family: ${THEME_FONT_FACE}, \1;/" \
			"${srcdir}/${_pkgname}/gnome-shell/gnome-shell.css"
	fi

	if [ "${THEME_FONT_SIZE}" != "9" ]; then
		sed -i -re "s/font-size: (.*);/font-size: ${THEME_FONT_SIZE}pt;/" \
			"${srcdir}/${_pkgname}/gnome-shell/gnome-shell.css"
	fi
}

package() {
  	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
