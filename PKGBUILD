# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-llvm-lines
pkgver=0.4.7
pkgrel=1
pkgdesc="Count the number of lines of LLVM IR across all instantiations of a generic function"
arch=('any')
url='https://github.com/dtolnay/cargo-llvm-lines'
license=( 'Apache')
depends=('cargo' 'rust-nightly' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('80b59e77dee53834dd2b0769f5719fc053c197c8d452a561de4998cc99f65b92')

build() {
	cd "$pkgname-$pkgver"
	# note: upstream does not provide Cargo.lock
	cargo build --release --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
