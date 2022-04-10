# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.4
pkgrel=1
url=https://github.com/aperezdc/termite
license=(LGPL)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=0.58' ninja)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=("${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.xz"{,.asc})
b2sums=('506d59a61e6f535feebcabc56d6651e1942cd35c3ca5baa21e775fb37c8a7a3d3beb9584cae1bba38d4b2fb20c878bced0345f0fa9894fa58410895cf1cae5f6'
        'SKIP')

build () {
	rm -rf _build
	arch-meson _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
