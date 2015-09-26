# Maintainer: jiangxq <jiangxueqian at gmail dot com>, zh99998 <zh99998@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>, 4679kun <admin at 4679 dot us>

pkgname=shadowsocks-libev
pkgver=2.3.3
pkgrel=5
pkgdesc='A lightweight secured socks5 proxy for embedded devices and low end boxes'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
depends=('openssl' 'libev')
makedepends=('gcc' 'make' 'autoconf' 'automake')
source=("https://github.com/shadowsocks/${pkgname}/archive/v${pkgver}.tar.gz"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service'
)

sha512sums=(
'd3cd1a523a14850321b312ad1e652099a5bb875e243c960f2883f2484b8c61738f432818acf288ba0d658c948b2b60b9dc72c6beee6de649dffef3236e7500a7'
'f0ca4f5ddb0877d692275c2b78a2f470b05e81a248e641c0afcbb54b21b68af969faeeca200ff38d152c3229b77353969dade0fd54c9d69fa1abb2aedfae9e3d'
'238a45e0ad5cdf1cdf835f94cdd914d6200596f439722f68cf100ac1d3dce4165ccbee9c03256fc084695974763363bf3313e94d366f4e1a8199de61579f50d0'
'd51aea23e4b4f9e4b8f290dca4da86c8cac4f5a08fe6444c650a72e3ffa244cbf3bdc88247231272dafb8d366d412b0401a7717b48c7d8ca1b90b023b10b2087'
'aa91d2e5556aa1c9ea5c1c3230e7bb209f2228d5fe03c03e2a175e9eb1dfcb9cabdfc388e5bdca5615c98784d8c7d208a329d4e50a0795c07cecdba480f18850'
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

