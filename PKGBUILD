# Maintainer: Ondrej Hosek <ondra.hosek@gmail.com>
pkgname=libemf2svg-git
pkgver=1.0.3.r54.b4e7764
pkgrel=1
pkgdesc="EMF (Microsoft Enhanced Metafile) to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libemf2svg"
license=('GPL')
depends=('libpng')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('libemf2svg::git+https://github.com/kakwa/libemf2svg.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
