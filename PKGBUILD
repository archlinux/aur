# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=hck
pkgver=0.7.1
pkgrel=1
pkgdesc='A sharp cut(1) clone'
arch=('x86_64')
url="https://github.com/sstadick/${pkgname%-bin}"
license=('Unlicense' 'MIT')
depends=('gcc-libs')
makedepends=(
	'cargo'
	'cmake'
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('f18da61f49fb21d4071d6d96160df9f81a98aa7045543dbc7f1f056d0e7f00cdd4a8de2a4073e387f1ab40fa8e80a4754bcb589e5b713cac9d1d95a7e4a6bba8')

build() {
	cd "$pkgname-$pkgver"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
