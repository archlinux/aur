# Maintainer: Tor Berge torberge@outlook.com



pkgname=speki
pkgver=0.2.21
pkgrel=0
pkgdesc="Flashcard app for your terminal"
url="https://github.com/TBS1996/speki"
license=("GPL-2.0-only")
arch=("x86_64")
provides=("speki")
conflicts=("speki")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('69cb12877a2977c4540e0bcbffad4852405e06399e3a220a18d87cc5ec43569e')




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
