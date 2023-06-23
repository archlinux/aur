
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=rsyn
pkgver=0.0.1
pkgrel=1
pkgdesc="[alpha] Wire-compatible rsync client in Rust"
arch=(any)
url="https://github.com/sourcefrog/rsyn/"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cargo)
provides=(rsyn)
conflicts=(rsyn-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourcefrog/rsyn/archive/refs/tags/v$pkgver.tar.gz"
        )
sha256sums=('f7fc062a63ebf1a6f35eae789028f238484881adacfc8828f2a4d7c1027456c0')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
    	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rsyn"
    	install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
