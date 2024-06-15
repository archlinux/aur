# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview
pkgver=0.5.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust' 'git')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('8efe6e07f853fb0d029fa38fc8898c7a21bbcc023dfb2d91fd0359ba74d479b4')

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
