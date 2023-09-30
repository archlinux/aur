# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview
pkgver=0.4.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust' 'git')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('73eefa34147ee44fe390b748486b098f13f9dc5638847c6ac6524a4672e30bd1')

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
