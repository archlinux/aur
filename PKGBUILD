# Maintainer: jiangxq <jiangxueqian at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>, 4679kun <admin at 4679 dot us>

pkgname=shadowsocks-libev
pkgver=2.2.2
pkgrel=2
pkgdesc='A lightweight secured scoks5 proxy for embedded devices and low end boxes'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
depends=('openssl' 'libev')
makedepends=('gcc' 'make' 'autoconf' 'automake')
source=("https://github.com/shadowsocks/${pkgname}/archive/v${pkgver}.tar.gz"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service')
sha512sums=(
'0d83a506e2ab95aa8ba1d1815d2e0a8213b96a901cf5e8939c00900167af96ae6045071f39fc07ac7daba328bc2eb1e89b0286e1e98744a8750916ec81b47f27'
'96e5c9ba04a8d45fa57728aeb5282cf25fce42baf2c2221c5040cced89196b25d2c212472ba9b3f53bdce93ad1edd5f06e42ec62ef212764349c1dab24dde16a'
'73925959731b7ab6e2b3900662f4b67a9986b798b1a4a943307c87574c9069e32a0c2298cf6e9adb895fe71316a3bac09cb684c54e8a1350566b2fe7526c1cff'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
	install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
}
