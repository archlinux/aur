# Maintainer: Hamid Jamal <hamidjamal@hotmail.co.uk>

pkgname=rippedgrep
pkgver=0.1.0
pkgrel=1
pkgdesc='A barebones basic implementation of Ripgrep'
url='https://github.com/Sparrowehawk/rippedgrep'
license=(MIT)
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/Sparrowehawk/rippedgrep/archive/refs/tags/working.tar.gz")
sha256sums=('b2b4e529f92d2faab7620bb01f5fd466acb95ab11379e3fb2874b9bf6ff4416b')

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}


###