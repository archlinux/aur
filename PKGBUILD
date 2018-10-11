# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@protornmail.com>
pkgname=pixelserv-tls
pkgver=2.2.0
pkgrel=1
pkgdesc="A tiny bespoke webserver for adblock with HTTP/1.1 and HTTPS support"
arch=('any')
url="https://kazoo.ga/pixelserv-tls/"
license=('GPL3')
depends=('openssl>=1.0.2')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/kvic-z/pixelserv-tls/archive/$pkgver.tar.gz"
	"pixelserv-ca-init.sh"
	"pixelserv-tls.service")
md5sums=('fee16251b14fef4509476685e364c360'
         'd53cf6340558d14eeb586a1129a87e9d'
         'fdb5a9de023c250a3e0d3712a836ca1e')


build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/pixelserv-tls.service" "$pkgdir/usr/lib/systemd/system/pixelserv-tls.service"
	install -Dm755 "$srcdir/pixelserv-ca-init.sh" "$pkgdir/usr/bin/pixelserv-ca-init"
}
