# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gtklock-dpms-module
pkgver=4.0.0
pkgrel=1
pkgdesc='GtkLock module which blanks monitors after idle'
url=https://git.sr.ht/~aperezdc/gtklock-dpms-module
license=(GPL-3.0-only)
arch=(x86_64)
depends=("gtklock>=${pkgver%.*}" "gtklock<$(( ${pkgver%%.*} + 1 ))")
makedepends=(gtk3 meson ninja wlr-protocols wayland)
source=("$url/refs/download/v$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=(2e715e2b0346be223c24fecc3083fbaf2e323bc8f2abfa3e2bf9c74ebc2fd5f7)

build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver"
	meson compile -C_build
}

package () {
	install -Dm755 _build/libgtklock-dpms.so "$pkgdir/usr/lib/gtklock/dpms.so"
}
