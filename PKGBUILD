# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gtklock-dpms-module
pkgver=4.0.1
pkgrel=1
pkgdesc='GtkLock module which blanks monitors after idle'
url=https://git.sr.ht/~aperezdc/gtklock-dpms-module
license=(GPL-3.0-only)
arch=(x86_64)
depends=("gtklock>=${pkgver%.*}" "gtklock<$(( ${pkgver%%.*} + 2 ))")
makedepends=(gtk3 meson ninja wlr-protocols wayland)
source=("$url/refs/download/v$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=(6e78d23a01ff6bc07210430bb2713093668411308a11244fd4a474ec46be1075)

build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver" \
		-Dmodule_version=$(gtklock --version | sed -e 's/[^0-9]*\([0-9.]\+\).*/\1/')
	meson compile -C_build
}

package () {
	install -Dm755 _build/libgtklock-dpms.so "$pkgdir/usr/lib/gtklock/dpms.so"
}
