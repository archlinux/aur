# Maintainer: TheWisker <TheWisker@protonmail.com>

pkgname=cavasik-git
pkgbase=cavasik-git
pkgver=v2.0.1
pkgrel=2
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/TheWisker/Cavasik
license=('GPL3')
depends=(cava libadwaita python-cairo python-gobject python-pydbus)
makedepends=(git meson)
checkdepends=(appstream-glib)
optdepends=()
provides=()
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	echo "$pkgver.r$pkgrel"
}

build() {
	arch-meson Cavasik build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlog
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 Cavasik/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
