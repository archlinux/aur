# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fnott
pkgver=1.3.0
pkgrel=1
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'tllist')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d17d6a55a7e0d56ddfc3277fbbefa7baf4c70f02265bcb8bd72ee464e202e454')

prepare() {
	cd "$pkgname"
	sed -i "/LICENSE/c\'README.md'," meson.build
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
	install -Dvm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
