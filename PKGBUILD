# Maintainer: aulonsal <seraur at aulonsal dot com>
pkgname=zet
pkgver=0.2.6
pkgrel=1
pkgdesc="CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines"
arch=('x86_64')
url="https://github.com/yarrow/$pkgname"
license=('APACHE' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('c38ef0cca4ea45f79554bae7c1235ee00215b7483c880c56d282346adda463a11dfda57a963106734d4fa8e5135cb0f9b1622265537d3068c9296d2446b458b3')

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
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
