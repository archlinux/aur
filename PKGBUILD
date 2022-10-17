# Maintainer: Tor Berge torberge@outlook.com



pkgname=speki
pkgver=0.1.11
pkgrel=0
pkgdesc="Flashcard app for your terminal"
url="https://github.com/TBS1996/speki"
license=("GPL-2.0-only")
arch=("x86_64")
provides=("speki")
conflicts=("speki")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b8edc6f5c3f54c35336d0391e89d13c64a2f7f164e9fd36e4b482ce6e7a8e7bc')




prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

}

check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	ls
    install -Dm755 "target/release/speki" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
