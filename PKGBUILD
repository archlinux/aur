# Maintainer: Fabio Comuni <fabrix.xm@gmail.com> 

pkgname=gst-plugin-qrcode
pkgver=0.2.1
pkgrel=1
pkgdesc="QRCode decoder plugin for GStreamer"
arch=('i686' 'x86_64')
license=('LGPL3')
url="https://github.com/fabrixxm/gst-plugin-qrcode"
depends=('gstreamer' 'quirc')  
source=("https://github.com/fabrixxm/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7b5bcf6b9c99460f41567884f7973bb2')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

post_install() {
	libtool --finish /usr/lib/gstreamer-1.0
	# is needed?
	ldconfig
}
