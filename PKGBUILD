# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fnott
pkgver=1.2.0
pkgrel=1
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'tllist')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d6cfb7efcfad5e0aa95c5fd9632c638a53a0debfc17128e70922a1ba9f841470')

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
	install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
