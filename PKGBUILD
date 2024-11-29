# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=gimoji
pkgver=1.1.1
pkgrel=1
pkgdesc='Easily add emojis to your git commit messages 🎉'
arch=(x86_64)
url="https://github.com/zeenix/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('3dac5d3334fd0a7aa922017279a546ec20ab1a83d896414b75e14ddca710bd4cc07da0216ef81b1207d875e85ad257f00e62c4937b271f5299ce69da6f643677')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
