# Maintainer: Arnob <arnob8066@gmail.com>
pkgname=simple-rust-stopwatch
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI stopwatch that saves your progress"
arch=('x86_64' 'aarch64')
url="https://github.com/Arnob90/simple-rust-stopwatch"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5eb30dcd3e64a6f69fc5a97f540fe532ad3ccf385a08c488d4d66508f30a0d5e')

prepare() {
	cd "$pkgname-$pkgver"
	export CARGO_HOME="$srcdir/cargo-home"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export CARGO_HOME="$srcdir/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release --all-targets
}

check() {
	cd "$pkgname-$pkgver"
	export CARGO_HOME="$srcdir/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
