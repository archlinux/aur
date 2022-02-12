# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fnott
pkgver=1.2.1
pkgrel=1
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'tllist')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a4e72845cde23aff0653f9b218a32cb40ae628b3f690dc02333ea95469faf216')

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
