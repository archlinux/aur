# Maintainer: Tor Berge torberge@outlook.com



pkgname=speki
pkgver=0.4.3
pkgrel=0
pkgdesc="Flashcard app for your terminal"
url="https://github.com/TBS1996/speki"
license=("GPL-2.0-only")
arch=("x86_64")
provides=("speki")
conflicts=("speki")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('fa600804a3ff1d34b6715c5651107610f39b1c51ef1f73b05d56e4338199d2ed')




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
