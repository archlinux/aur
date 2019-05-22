# Maintainer: Anton Leontiev <scileont at gmail dot com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gst-rtsp-server
pkgver=1.16.0
pkgrel=2
pkgdesc='RTSP server library based on GStreamer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://gstreamer.freedesktop.org/modules/gst-rtsp-server.html'
license=('LGPL')
depends=("gst-plugins-base>=$pkgver")
source=(https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19'
            'SKIP')
validpgpkeys=('D637032E45B8C6585B9456565D2EEE6F6F349D7C')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir"
	install -Dm755 examples/.libs/test-mp4 "$pkgdir/usr/bin/gst-rtsp-mp4"
	install -Dm755 examples/.libs/test-launch "$pkgdir/usr/bin/gst-rtsp-launch"
	install -Dm755 examples/.libs/test-netclock "$pkgdir/usr/bin/gst-rtsp-netclock"
	install -Dm755 examples/.libs/test-netclock-client "$pkgdir/usr/bin/gst-rtsp-netclock-client"
}
