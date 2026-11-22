# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.16
pkgrel=1
url=https://github.com/barbuk/termite
license=(LGPL-2.1-only)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=1.0' ninja glib2-devel)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(9F59A49568EE372AF17E5452B6D01F84A7519939)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.zst")
sha256sums=('d91226c52533b240cb395e961cb8985867c8b01afe361327d8dc163502108c3c')

build () {
	arch-meson _build .
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
