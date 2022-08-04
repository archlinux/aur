# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-criterion
pkgver=1.1.0
pkgrel=2
pkgdesc='Cargo plugin for analyzing and reporting on Criterion-rs benchmarks.'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/bheisler/cargo-criterion'
license=('Apache' 'MIT')
depends=('cargo' 'rust')
optdepends=('gnuplot: generate detailed graphs with gnuplot')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fe156bf7b360874419f7a97349c9f2fa94ab5fd6dc2c06b0070053f9d5596445')

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
