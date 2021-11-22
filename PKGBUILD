# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=hck
pkgver=0.7.0
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
b2sums=('cd6b690d83d7fd375bf7f4a9dd70e06aa2daf7c4daddfa0e9cfeeb009a1c77f278c52249c96b030910ef80e9d652ffc75bbe62467d025faf749f0c500ab741d3')

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
