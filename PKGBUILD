# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=xcursor-simp1e
pkgname=(xcursor-simp1e{,-breeze{,-snow},-dark,-solarized})
pkgdesc='An aesthetic cursor theme'
pkgver=0.0.20211003
pkgrel=1
url=https://gitlab.com/zoli111/simp1e/
_commit=6a9e969b0239a58fc96af787c4986c273eb6d0eb
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
	./build.sh
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/built_themes/$1" "${pkgdir}/usr/share/icons"
}

package_xcursor-simp1e () {
	_package Simp1e
}
package_xcursor-simp1e-dark () {
	_package Simp1e-dark
}
package_xcursor-simp1e-breeze () {
	_package Simp1e-breeze
}
package_xcursor-simp1e-breeze-snow () {
	_package Simp1e-breeze-snow
}
package_xcursor-simp1e-solarized () {
	_package Simp1e-solarized
}
