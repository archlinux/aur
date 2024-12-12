# Maintainer: Jacki <jacki AT thejackimonster DOT de>

_pkgname='npainter'

pkgname="${_pkgname}-git"
pkgver='r528.250974f'
pkgrel=1
pkgdesc='fast and simple digital painting software'
arch=('x86_64')
url="https://mrgaturus.itch.io/npainter"
license=('GPL2')
conflicts=("${_pkgname}" "${_pkgname}-bin")
provides=("${_pkgname}")
depends=(gdk-pixbuf2 freetype2 libpng libglvnd libxcursor libxi zstd)
makedepends=(nim)
source=("git+https://github.com/mrgaturus/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./build_linux.sh
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
	cp -dpr --no-preserve=ownership "data" "${pkgdir}/usr/share/${_pkgname}/data"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

