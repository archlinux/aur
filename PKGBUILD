# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=amber-theme-git
pkgver=r90.25f3139
pkgrel=1
pkgdesc='GTK+ and GNOME Shell theme based on the Ubuntu Ambiance theme'
url=https://github.com/lassekongo83/amber-theme
license=(GPL)
arch=(any)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	mkdir -p "${pkgdir}/usr/share/themes/Amber"
	cp -r gtk-2.0 gtk-3.0 gnome-shell "${pkgdir}/usr/share/themes/Amber/"
}
