# Maintainer: alessandro (gort818) <gort818@gmail.com>

pkgname=ddgtk
pkgver=0.1.r16.g82f07e1
pkgrel=1
pkgdesc='A frontend Gui to dd for making bootable usb disks'
arch=('any')
license=('GPL3')
url="https://github.com/gort818/${pkgname%-git}"
depends=('python3' 'python-gobject' 'gtk3')
makedepends=('git' 'meson')
source=('ddgtk::git+https://github.com/gort818/ddgtk#branch=master')
sha1sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd "$srcdir/${pkgname%-git}/build"
	meson
	ninja
}
package() {
    cd "$srcdir/${pkgname%-git}/build"
    DESTDIR="$pkgdir" ninja install
}
