# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=xcursor-simp1e
pkgname=(xcursor-simp1e{,-breeze{,-snow},-dark,-catpuccin,-{solarized,gruvbox,nord}-{dark,light},-tokyo-night})
pkgdesc='An aesthetic cursor theme'
pkgver=5.0
pkgrel=1
url=https://gitlab.com/zoli111/simp1e/
_commit=599160278e64b8cddf0a6ca4fdc946e8c8b81b94
arch=(any)
makedepends=(git librsvg python-pillow xorg-xcursorgen)
depends=()
license=(GPL3)
source=("${pkgname}::git+${url}#commit=${_commit}"
        "builder_script::git+https://github.com/mxre/cursor")
sha512sums=(SKIP SKIP)

prepare () {
	cd "${pkgname}"
	git submodule init
	git config submodule.builder_script.url "${srcdir}/builder_script"
	git submodule update
}

build () {
	cd "${pkgname}"
	./generate_svgs.sh
	./build_cursors.sh
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/built_themes/$1" "${pkgdir}/usr/share/icons"
}

package_xcursor-simp1e () {
	_package Simp1e
}
package_xcursor-simp1e-dark () {
	_package Simp1e-Dark
}
package_xcursor-simp1e-breeze () {
	_package Simp1e-Breeze
}
package_xcursor-simp1e-breeze-snow () {
	_package Simp1e-Breeze-Snow
}
package_xcursor-simp1e-solarized-light () {
	replaces=(xcursor-simp1e-solarized)
	_package Simp1e-Solarized-Light
}
package_xcursor-simp1e-solarized-dark () {
	_package Simp1e-Solarized-Dark
}
package_xcursor-simp1e-gruvbox-light () {
	_package Simp1e-Gruvbox-Light
}
package_xcursor-simp1e-gruvbox-dark () {
	_package Simp1e-Gruvbox-Dark
}
package_xcursor-simp1e-nord-light () {
	_package Simp1e-Nord-Light
}
package_xcursor-simp1e-nord-dark () {
	_package Simp1e-Nord-Dark
}
package_xcursor-simp1e-tokyo-night () {
	_package Simp1e-Tokyo-Night
}
package_xcursor-simp1e-catpuccin () {
	_package Simp1e-Catpuccin
}
