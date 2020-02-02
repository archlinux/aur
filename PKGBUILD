# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=pixelserv-tls
pkgver=2.3.1
pkgrel=1
pkgdesc="A tiny bespoke webserver for adblock with HTTP/1.1 and HTTPS support"
arch=('any')
url="https://kazoo.ga/pixelserv-tls/"
license=('GPL3')
depends=('openssl>=1.0.2')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/kvic-z/pixelserv-tls/archive/v$pkgver.tar.gz"
	"pixelserv-ca-init.sh"
	"pixelserv-tls.service")
md5sums=('9eb1bebf949628ea030d868817d223b8'
         'a1c0b49b4e2e6653dbf96239ecc31c55'
         '70e0895550f301303e09eb5dfabdde42')

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
