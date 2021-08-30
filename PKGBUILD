# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.0
pkgrel=1
url=https://github.com/aperezdc/termite
license=(LGPL)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=0.58' ninja)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=("${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.xz"{,.asc})
sha256sums=('426f4633d1ded371599278555167c8cafb87236bb021d9ea45025179b29d186e'
            'SKIP')

build () {
	rm -rf _build
	arch-meson _build "termite-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
