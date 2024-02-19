# Maintainer: Avery <aur@avery.cafe>

pkgname=delfin
pkgver=0.4.1
pkgrel=1
pkgdesc="Stream movies and TV shows from Jellyfin"
arch=(x86_64 aarch64)
url=https://delfin.avery.cafe/
license=(GPL-3.0)
depends=(gtk4 libadwaita mpv)
makedepends=(cargo clang meson mold)
provides=(delfin)
source=("https://codeberg.org/avery42/delfin/archive/v$pkgver.tar.gz")
sha256sums=('29fb6db664a43ff1d297ea3515b679cb76542521de2e493f8384a4575ec2480e')

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
