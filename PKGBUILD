# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview
pkgver=0.3.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust' 'git')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('c193c3ccf18136661c4e1e73993c57fba672606b673bec41c3d2dd5d29a91245')

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
