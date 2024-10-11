# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Understated cursor theme - black, tailless'
pkgname=xcursor-cz-hickson-black
pkgver=20210706
pkgrel=0
_commit=02a7977b3d009525c95787c756fce8d824960e4c
license=(GPL3)
url="https://github.com/charakterziffer/cursor-toolbox"
_repo=${url##*/}
arch=(any)
makedepends=(git xorg-xcursorgen patch)
depends=()
source=("git+${url}#commit=${_commit}" build.patch)
sha512sums=('SKIP'
            'c2b8792e0a9afd639864608dc674acbc1a368d9a83cd46dd3422403961af2b001c3eb004269eb701fcd34f4cfceaca5912a751a6ecd68ad08901ec94e0afb972')

prepare () {
	cd "${_repo}"
	patch -p1 < "${srcdir}/build.patch"
}

build () {
	cd "${_repo}"
	msg2 "Rendering variant: Hickson v3 black"
	# python render-pngs.py "more-themes/cz-Hickson/cz-Hickson_v3-black.svg"
	ln -s more-themes/cz-Hickson/pngs-black pngs
	themetitle="cz-Hickson-black" ./make.sh
}

package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${_repo}/cz-Hickson-black" "${pkgdir}/usr/share/icons/"
}
