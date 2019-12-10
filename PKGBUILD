# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=organizer-git
pkgver=0.201.r0.g87e988e
pkgrel=2
pkgdesc="Python GTK app to organize your files"
arch=('any')
url="https://gitlab.gnome.org/aviwad/organizer"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/aviwad/organizer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
 	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
