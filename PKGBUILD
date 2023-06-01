# Maintainer: aulonsal <seraur at aulonsal dot com>
pkgname=zet
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines"
arch=('x86_64')
url="https://github.com/yarrow/$pkgname"
license=('APACHE' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0ec24e512c64c25cdb3d83b168967b36803b1fee30653252416c72be2f29579742bba26034d38f2d6a3fda3415e5cd734af21e846896fbb807af349c18248e8b')

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
