# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
pkgver=1.13.0
pkgrel=2
pkgdesc="GTK+ clipboard manager"
arch=('x86_64')
license=('GPL')
url="https://launchpad.net/diodon"
depends=('gtk3' 'libayatana-appindicator' 'libpeas' 'libxtst' 'zeitgeist')
makedepends=('gobject-introspection' 'meson' 'vala' 'xorg-server-xvfb')
provides=('libdiodon.so')
source=("$pkgname-$pkgver.tar.xz::$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('5f25ce431ef083afdefa50103f22d3e16d47ec753ed2b29867a04e25146e17a1')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
