# Maintainter: Woshiluo Luo <woshiluo.luo@outlook.com>
pkgname=phantun
pkgver=0.7.0
pkgrel=1
pkgdesc="Transforms UDP stream into (fake) TCP streams\
		 that can go through Layer 3 & Layer 4 (NAPT) firewalls/NATs."
arch=('x86_64')
url="https://github.com/dndx/phantun"
license=('APACHE')
makedepends=('git' 'rust')
source=(https://github.com/dndx/phantun/archive/refs/tags/v${pkgver}.zip)

sha256sums=('d719a779be4e7a7d8e152e3beb7cbe4002227310529830a83b6fe6339a6b7a8c')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir/usr/bin
	install -m 755 target/release/client ${pkgdir}/usr/bin/phantun_client
	install -m 755 target/release/server ${pkgdir}/usr/bin/phantun_server
}
