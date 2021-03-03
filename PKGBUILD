# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-criterion
pkgver=1.0.1
pkgrel=3
pkgdesc='Cargo plugin for analyzing and reporting on Criterion-rs benchmarks.'
arch=('any')
url='https://github.com/bheisler/cargo-criterion'
license=('Apache' 'MIT')
depends=('cargo' 'rust')
optdepends=('gnuplot: generate detailed graphs with gnuplot')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ce2e334403134130ab81e049f19529d6a142b94882898a304550c775a5b0ca5d')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
