# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gst-validate
pkgver=1.14.4
pkgrel=1
pkgdesc="Debugging tool for GStreamer"
arch=(x86_64)
url="https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-validate/html/"
license=(LGPL2.1)
depends=(gst-plugins-base-libs gtk3 python)
makedepends=(gobject-introspection)
source=(https://gstreamer.freedesktop.org/src/gst-validate/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7'
            'SKIP')
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5' # Sebastian Dröge
              'D637032E45B8C6585B9456565D2EEE6F6F349D7C') # Tim-Philipp Müller

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
