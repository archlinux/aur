# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=xcursor-simp1e
pkgdesc='An aesthetic cursor theme'
pkgver=0.0.20210719
pkgrel=2
url=https://gitlab.com/zoli111/simp1e/
_commit=995f50da41786263c89f10ddb72416a61462c973
arch=(any)
makedepends=(git inkscape python-pillow xorg-xcursorgen)
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

package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/built_themes/Simp1e" "${pkgdir}/usr/share/icons"
}
