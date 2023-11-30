# Maintainer: Avery <aur@avery.cafe>

pkgname=delfin-git
pkgver=v0.1.0.r0.g4ca4574
pkgrel=1
pkgdesc="Stream movies and TV shows from Jellyfin"
arch=(x86_64 aarch64)
url=https://delfin.avery.cafe/
license=(GPL-3.0)
depends=(gtk4 libadwaita mpv)
makedepends=(cargo clang meson mold)
provides=(delfin)
source=("$pkgname::git+https://codeberg.org/avery42/delfin.git")
sha256sums=(SKIP)

pkgver() {
	cd "$pkgname" || exit
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
