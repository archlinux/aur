# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=hck
pkgver=0.5.3
pkgrel=1
pkgdesc='A sharp cut(1) clone'
arch=('x86_64')
url="https://github.com/sstadick/${pkgname%-bin}"
license=('Unlicense' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('4fced3fd99f2eca6226bfdb21eb90e29f57e0b21c7fbf40b55a83f40e37275cbfad92021e07074ad15ccd993a3d2b696cd785bfadd7b61769694a0892bbcd0cd')

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
