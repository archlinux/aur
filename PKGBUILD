# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
pkgver=1.12.0
pkgrel=2
pkgdesc="GTK+ clipboard manager"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/diodon"
depends=(
	'gobject-introspection'
	'libappindicator-gtk3'
	'libayatana-appindicator'
	'libpeas'
	'xorg-server-xvfb'
	'zeitgeist')
makedepends=('cmake' 'meson' 'vala')
source=("$pkgname-$pkgver.tar.xz::$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('e5f0d8165e293e10a21a0466b50dfaee6ecaa56b678f72bf161ee09287b65f09')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir/"
}
