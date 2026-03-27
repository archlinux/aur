# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=tokount
pkgver=2.1.6
pkgrel=1
pkgdesc="The fastest line counter for codebases"
arch=(x86_64)
url="https://github.com/velox-sh/tokount"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8626b02b7ded170b04dab716fbac3c40610ba46cfe4b7a976fc5bca8faa39ad1')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --all-features --test flags --test errors
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
