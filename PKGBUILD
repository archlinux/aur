# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='A theme for GNOME/Budgie/Xfce/Cinnamon desktop with elementary-ish aesthetics.'
pkgname=gtk-theme-adementary-git
pkgver=r272.e261167
pkgrel=1
url=https://github.com/hrdwrrsk/adementary-theme
arch=(any)
license=(GPL3)
provides=(gtk-theme-adementary)
conflicts=(gtk-theme-adementary)
depends=()
makedepends=(git bash sassc bc)
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

build () {
	cd "${pkgname}"
	./parse-sass.sh
}

package () {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/share/themes"
	./install.sh --dest "${pkgdir}/usr/share/themes"

	# Clean installed shell scripts
	find "${pkgdir}/usr/share/themes" -name '*.sh' -delete
}
