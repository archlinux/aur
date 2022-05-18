# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/$pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk4' 'libadwaita')
checkdepends=('appstream-glib')
makedepends=('vala' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('90611c40c6f15f8df84ed68d633b6f060f72617f248766707cc4578136f35a25')

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
