# Maintainer: jiangxq <jiangxueqian at gmail dot com>, zh99998 <zh99998@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>, 4679kun <admin at 4679 dot us>

pkgname=shadowsocks-libev
pkgver=2.3.3
pkgrel=6
pkgdesc='A lightweight secured socks5 proxy for embedded devices and low end boxes'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
depends=('openssl' 'libev' 'libcap')
makedepends=('gcc' 'make' 'autoconf' 'automake')
install=${pkgname}.install
source=("https://github.com/shadowsocks/${pkgname}/archive/v${pkgver}.tar.gz"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service'
)

sha512sums=(
'd3cd1a523a14850321b312ad1e652099a5bb875e243c960f2883f2484b8c61738f432818acf288ba0d658c948b2b60b9dc72c6beee6de649dffef3236e7500a7'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --enable-shared
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
	install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
        install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
        install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
}

