# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gst-rtsp-server
pkgver=1.16.1
pkgrel=3
pkgdesc="RTSP server library based on GStreamer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://gstreamer.freedesktop.org/modules/gst-rtsp-server.html"
license=('LGPL')
makedepends=('meson')
depends=("gst-plugins-base>=$pkgver" "gst-plugins-bad>=$pkgver")
source=("https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144'
            'SKIP')
validpgpkeys=('D637032E45B8C6585B9456565D2EEE6F6F349D7C') # Tim-Philipp Müller <tim@centricular.com>

build() {
	meson --prefix /usr --buildtype plain $pkgname-$pkgver build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm755 build/examples/test-mp4 "$pkgdir/usr/bin/gst-rtsp-mp4"
	install -Dm755 build/examples/test-launch "$pkgdir/usr/bin/gst-rtsp-launch"
	install -Dm755 build/examples/test-netclock "$pkgdir/usr/bin/gst-rtsp-netclock"
	install -Dm755 build/examples/test-netclock-client "$pkgdir/usr/bin/gst-rtsp-netclock-client"
}
