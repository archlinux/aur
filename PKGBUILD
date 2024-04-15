# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.8
pkgrel=1
url=https://github.com/aperezdc/termite
license=(LGPL-2.1-only)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=1.0' ninja)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=("${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.lz"{,.asc})
b2sums=('f19c8387e604da5c5e49b2b7d6ca23d22de679c2954ac00edc9f3314d294d1f0c35992614f73381eb5d52b95c4748b2172699adc590621f2b21d9f1ec4da7323'
        'SKIP')

build () {
	rm -rf _build
	arch-meson _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
