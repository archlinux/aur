# Maintainer: frank AT apsu DOT be
pkgname=geoipmarker
pkgver=1.1.0
pkgrel=1
pkgdesc="Use iptables NFQUEUE to mark packets by country, using a MaxMind GeoIP2 Database"
license=('AGPL3')
arch=(i686 x86_64)
url="https://github.com/m4rienf/GeoIPMarker"

depends=("libmaxminddb"
         "libnetfilter_queue"
         "libsystemd")

provides=(geoipmarker)

install=geoipmarker.install

source=("https://github.com/m4rienf/GeoIPMarker/releases/download/v$pkgver/geoipmarker-$pkgver.tar.bz2"
	    "geoipmarker.install"
)

sha512sums=('060097763d06ec1c96b8958a7bdb59d27a256151c0a4fa5402aed7f83b1a80e7dd6ab0190ed9f1d9dae46f9ce2f6a1a12b8a8e3a3986ff227310fc1dc5aa357c'
            '51873d5361dbf975a1b55a85c77e831119e1586becb7a91e5c07c03e71a1e63e3a4cab85c0293eae5c0f93d54a40cfd1e17381bfe84a27c72a0af6a7befcf305')

build() {
	cd "$srcdir/geoipmarker-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/geoipmarker-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
