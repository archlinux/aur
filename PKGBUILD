pkgname=ablescript
pkgdesc="The best programming language"
pkgver=0.5.2
pkgrel=1
arch=(x86_64 i686 aarch64)
license=(MIT)
url="https://git.ablecorp.us/ablescript/able-script"
makedepends=(cargo)
cratename=ablescript_cli
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
b2sums=("fa47dec49e0bd74f26f8dca12e8e6463a355e7849b11525333304564ad5eda559478a11e7ab2af83e8d11f05e15a211d0499428406075af484f4022c0a686893")

export RUSTUP_TOOLCHAIN=stable

prepare() {
  cd "$cratename-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$cratename-$pkgver"
  CARGO_TARGET_DIR=target \
    cargo build --frozen --release
}

check() {
  cd "$cratename-$pkgver"
  cargo test --frozen
}

package() {
  cd "$cratename-$pkgver"
  install -Dm0755 "target/release/$cratename" "$pkgdir/usr/bin/ablescript"
}
