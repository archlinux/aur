# Maintainer: TheWisker <TheWisker@protonmail.com>

pkgname=cavasik-git
pkgbase=cavasik
pkgver=v2.0.0
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/TheWisker/${pkgbase^}
license=('GPL3')
depends=(cava libadwaita python-cairo python-gobject python-pydbus)
makedepends=(git meson)
checkdepends=(appstream-glib)
optdepends=()
provides=()
conflicts=("${pkgbase}")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	echo "dev"
}

build() {
	arch-meson ${pkgbase^} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlog
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${pkgbase^}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase"
}
