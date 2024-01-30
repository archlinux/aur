# Maintainer: Avery <aur@avery.cafe>

pkgname=delfin
pkgver=0.4.0
pkgrel=1
pkgdesc="Stream movies and TV shows from Jellyfin"
arch=(x86_64 aarch64)
url=https://delfin.avery.cafe/
license=(GPL-3.0)
depends=(gtk4 libadwaita mpv)
makedepends=(cargo clang meson mold)
provides=(delfin)
source=("https://codeberg.org/avery42/delfin/archive/v$pkgver.tar.gz")
sha256sums=('fd438fb8dc82f0bac1b3eecc9142747320df41077b332290238e0cbee62c7715')

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
