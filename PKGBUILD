# Maintainer: TheWisker <TheWisker@protonmail.com>

pkgname=cavasik
pkgbase=cavasik
pkgver=v2.0.1
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/TheWisker/${pkgname^}
license=('GPL3')
depends=(cava libadwaita python-gobject python-cairo python-pydbus)
makedepends=(git meson)
checkdepends=(appstream-glib)
optdepends=()
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url#tag=$pkgver")
b2sums=('SKIP')

build() {
	arch-meson ${pkgname^} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlog
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${pkgname^}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
