# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gtklock-dpms-module
pkgver=3.0.0
pkgrel=1
pkgdesc='GtkLock module which blanks monitors after idle'
url=https://git.sr.ht/~aperezdc/gtklock-dpms-module
license=(GPL-3.0-only)
arch=(x86_64)
depends=("gtklock>=${pkgver%.*}" "gtklock<$(( ${pkgver%%.*} + 1 ))")
makedepends=(gtk3 meson ninja wlr-protocols wayland)
source=("$url/refs/download/v$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=(ac7e335af1ddbe092562172194d5c30ebee1f3e30d9f88f49dda181091ad83af)

build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver"
	meson compile -C_build
}

package () {
	install -Dm755 _build/libgtklock-dpms.so "$pkgdir/usr/lib/gtklock/dpms.so"
}
