# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview
pkgver=0.1.2
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'cargo' 'git')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('d281fa0c8d81a1bab39988d94b075a813dcef4eb31581e457907c4535108b8df')

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
