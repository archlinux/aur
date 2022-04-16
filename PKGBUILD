# Maintainter: Woshiluo Luo <woshiluo.luo@outlook.com>
pkgname=phantun
pkgver=0.4.1
pkgrel=2
pkgdesc="Transforms UDP stream into (fake) TCP streams\
		 that can go through Layer 3 & Layer 4 (NAPT) firewalls/NATs."
arch=('x86_64')
url="https://github.com/dndx/phantun"
license=('APACHE')
makedepends=('git' 'rust')
source=(https://github.com/dndx/phantun/archive/refs/tags/v${pkgver}.zip)

sha256sums=('6fae88e9d97470810b0fc482b9909c3b679e7677c78c2fe31584c909bbf7ee3d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir/usr/bin
	install -m 755 target/release/client ${pkgdir}/usr/bin/phantun-client
	install -m 755 target/release/server ${pkgdir}/usr/bin/phantun-server
}
