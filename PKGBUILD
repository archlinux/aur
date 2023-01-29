# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=cavalier
pkgver=2023.01.29
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/fsobolev/$pkgname
license=(MIT)
depends=(cava libadwaita python-gobject)
makedepends=(git meson)
checkdepends=(appstream-glib)
source=(git+$url#tag=$pkgver)
b2sums=(SKIP)

build() {
	arch-meson $pkgname build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlog
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${pkgname%-git}/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
