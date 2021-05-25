# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview
pkgver=0.1.1
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64' 'aarch64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('51492f70f3bdefc1e09e2074276b4d049e95ae9195120c6207e63c056fc60a22')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
