# Maintainter: Woshiluo Luo <woshiluo.luo@outlook.com>
pkgname=phantun
pkgver=0.3.2
pkgrel=2
pkgdesc="Transforms UDP stream into (fake) TCP streams\
		 that can go through Layer 3 & Layer 4 (NAPT) firewalls/NATs."
arch=('x86_64')
url="https://github.com/dndx/phantun"
license=('APACHE')
makedepends=('git' 'rust')
source=(https://github.com/dndx/phantun/archive/refs/tags/v${pkgver}.zip)

sha256sums=('17cb6969d1023c52d069eaa3ab0cfc01c5fde9fd5ceeb6ea415c04908c4772d9')

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
