# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gtklock-dpms-module
pkgver=2.1.1
pkgrel=1
pkgdesc='GtkLock module which blanks monitors after idle'
url=https://git.sr.ht/~aperezdc/gtklock-dpms-module
license=(GTK-3.0-only)
arch=(x86_64)
depends=("gtklock>=${pkgver%.*}" "gtklock<$(( ${pkgver%%.*} + 1 ))")
makedepends=(gtk3 meson ninja wlr-protocols wayland)
source=("$url/refs/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=(9f03391286eec962d980b062ce39309c3407f93cae0f2c958b82a0e1d1e4c5f8)

build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver"
	meson compile -C_build
}

package () {
	install -Dm755 _build/libgtklock-dpms.so "$pkgdir/usr/lib/gtklock/dpms.so"
}
