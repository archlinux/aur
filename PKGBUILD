# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=organizer-git
pkgver=0.103.r0.gea2bb49
pkgrel=1
pkgdesc="Python GTK app to organize your files"
arch=('any')
url="https://gitlab.gnome.org/aviwad/organizer"
license=('GPL3')
depends=('python' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('git' 'meson')
provides=('organizer')
conflicts=('organizer')
source=("git+https://gitlab.gnome.org/aviwad/organizer.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
 	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	meson . build --prefix /usr
	ninja -C build
}

package() {
 	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
