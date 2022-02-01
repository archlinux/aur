
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=wayab-git
_pkgname=${pkgname%-*}
pkgver=r21.6d12681
pkgrel=1
pkgdesc='Wayland animated background.'
arch=('x86_64')
url='https://github.com/chux0519/wayab'
license=('GPL3')
provides=('wayab')
depends=('wayland' 'egl-wayland' 'wayland-protocols' 'cairo-glesv2-bin')
makedepends=('cmake')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/$_pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
    	cd "$srcdir/build"
	install -Dm755 wayab -t "$pkgdir/usr/bin"

	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
