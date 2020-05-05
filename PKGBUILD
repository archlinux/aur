# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=oreo-cursors-git
pkgver=r4.34dc4ed
pkgrel=3
pkgdesc="Color material cursors with cute animations."
arch=('any')
url="https://www.pling.com/p/1360254"
license=('GPL2')
makedepends=('git' 'gtk-engine-murrine' 'inkscape' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/varlesh/oreo-cursors.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Fix for inkscape 1.0
	sed -i 's/inkscape -z -e/inkscape -o/g' build.sh

	make clean
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
