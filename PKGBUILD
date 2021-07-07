# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet
pkgver=0.2.0
pkgrel=2
pkgdesc="CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines"
arch=(x86_64 armv6h armv7h aarch64)
url="https://github.com/yarrow/${pkgname%-bin}"
license=('APACHE' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d9bef05361700bf2151c8c4c3109c5257b7b73faa014f8f1e574df18bffa81e52380d82eea18364f5d0c05499d252b5c8c83e40cf9433549e1f76301700e7840')

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
