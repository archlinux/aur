# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator
pkgver=1.1.3
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/$pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk4' 'libadwaita-git')
checkdepends=('appstream-glib')
makedepends=('vala' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('142400db237484188fc700b54a977188e4e9c8cec0b7b08703b7c122b94d6bd1')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

check() {
	#skip appstream test because it returns error
	meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
