# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='A simple VTE-based terminal, aperezdc fork'
pkgname=termite-aperezdc
pkgver=15.3
pkgrel=1
url=https://github.com/aperezdc/termite
license=(LGPL)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=0.58' ninja)
conflicts=(termite termite-git)
provides=(termite)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=("${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.xz"{,.asc})
sha256sums=('c85da2d4d4aa96a85daa316f08f843562891a8ab64a003d0f2bc31ab4c6f494b'
            'SKIP')

build () {
	rm -rf _build
	arch-meson _build "termite-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
