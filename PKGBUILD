# Maintainer: Björn "zemrod" Bravin <sinon dot adastrum at gmail dot com>
pkgname=rawk
pkgver=0.6.8f
pkgrel=2
pkgdesc="a minimal tool inspired by gawks string seperation ability"
arch=('x86_64')
url="https://github.com/Zemrod/$pkgname"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
provides=('rawk')
conflicts=('rawk')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Zemrod/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('20159af3b825bf76c7a0383e6a1ba8b8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/rawk" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
