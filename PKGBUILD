# Maintainer: Björn "zemrod" Bravin <sinon dot adastrum at gmail dot com>
pkgname=rawk
pkgver=0.6.3
pkgrel=1
pkgdesc="a minimal tool inspired by gawks string seperation ability"
arch=('x86_64')
url="https://gitlab.com/Zemrod/$pkgname"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
provides=('rawk')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/Zemrod/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('46b77826fe6038eb40fdf759cb10c33f')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$srcdir/$pkgname-v$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	install -Dm755 "target/release/rawk" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
