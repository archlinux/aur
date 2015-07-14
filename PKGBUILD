# Maintainer: jiangxq <jiangxueqian at gmail dot com>

pkgname=shadowsocks-libev
pkgver=2.2.2
pkgrel=1
pkgdesc="A lightweight secured socks5 proxy for embedded devices and low end boxes."
arch=("i686" "x86_64")
url="http://github.com/shadowsocks/$pkgname"
license=("GPL3")
depends=("libev" "openssl")
makedepends=("gcc" "git" "make")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/shadowsocks/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('05185c3ed15003ef8644bbe4a39edcf079bb7198')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
	cd "$pkgdir/usr/lib/pkgconfig"
	grep -v '^prefix=' shadowsocks-libev.pc > ~shadowsocks-libev.pc
	rm shadowsocks-libev.pc
	echo 'prefix=' | cat - ~shadowsocks-libev.pc > shadowsocks-libev.pc
	rm ~shadowsocks-libev.pc
}
