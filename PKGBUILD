# Maintainer: Avery <aur@avery.cafe>

pkgname=delfin
pkgver=0.4.5
pkgrel=1
pkgdesc="Stream movies and TV shows from Jellyfin"
arch=(x86_64 aarch64)
url=https://delfin.avery.cafe/
license=(GPL-3.0)
depends=(gtk4 libadwaita mpv)
makedepends=(cargo clang meson mold)
provides=(delfin)
source=("https://codeberg.org/avery42/delfin/archive/v$pkgver.tar.gz")
sha256sums=('4ca9b666ffe381f9b66afd4703ca891a4db3f55bb3cc367c8006f2b6753a7cf0')

build() {
	cd "$pkgname" || exit

	meson setup build -Dprefix=/usr -Dprofile=release
	cd build || exit

	meson compile
}

package() {
	cd "$pkgname"/build || exit

	meson install --destdir "$pkgdir"
}
