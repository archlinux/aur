# Maintainer: Ondrej Hosek <ondra.hosek@gmail.com>
pkgname=libvisio2svg-git
pkgver=0.5.4.r4.8c05dd0
pkgrel=1
pkgdesc="Visio to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libvisio2svg"
license=('GPL')
depends=('libemf2svg' 'libwmf' 'librevenge' 'libvisio' 'libxml2' 'freetype2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('libvisio2svg::git+https://github.com/kakwa/libvisio2svg.git')
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
