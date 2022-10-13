# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Plot on the command line'
pkgname=plot
pkgver=0.5.1
pkgrel=1
url=https://github.com/annacrombie/plot
license=(custom:MIT)
arch=(x86_64)
depends=(ncurses)
makedepends=(meson ninja scdoc)
checkdepends=(valgrind)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f26cab24a09865f7ee9393b1ae60014ea5fc70e2c712520f3e7307fb24beb42a992f4566ecc783ce3c5d60e2178405169c057ad4a0dec7154ff5d3e21fb88965')

build () {
	arch-meson _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

check () {
	meson test -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
