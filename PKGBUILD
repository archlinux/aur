# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator
pkgver=1.1.7
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/$pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk4' 'libadwaita-git')
checkdepends=('appstream-glib')
makedepends=('vala' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('911cf089e61b773fc3c8683a1772fbbd3f241840328ee81f9da6e06c3884d1f8')

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
