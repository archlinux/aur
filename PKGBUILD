# Maintainer: alessandro (gort818) <gort818@gmail.com>

pkgname=ddgtk
pkgver=0.1.r3.g5b25b7c
pkgrel=1
pkgdesc='A fronted Gui to dd for making bootable usb disks'
arch=('any')
license=('GPL3')
url="https://github.com/gort818/ddgtk"
depends=('python3' 'python-gobject' 'gtk3' 'vte')
makedepends=('git' 'meson')
source=('ddgtk::git+https://github.com/gort818/ddgtk#branch=master')
sha1sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
	cd "$srcdir/ddgtk"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/ddgtk"
	rm -rf build
    mkdir build
    cd build
    meson --prefix /usr --buildtype release ..
    ninja
}
package() {
    cd "$srcdir/ddgtk"
    cd build
    DESTDIR="$pkgdir" ninja install
}
