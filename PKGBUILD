# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fnott
pkgver=1.1.2
pkgrel=1
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'tllist>=1.0.1')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dcb8776ec5fef4e06d255bfc51b41fe3bb30373f8be6540c6ece3aeff59ee8ad7ad85daad807b00de6bb528ea35198249bd0ce67b2f7e62e44206ac1d097feed')

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
	install -Dm 644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
