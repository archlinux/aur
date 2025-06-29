# Maintainer: valaxiar <accounts@valaxiar.xyz>

pkgname=sound-encode
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast and minimal CLI tool to encode files as .wav"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/valaxiar/sound-encode"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+$url.git#branch=master")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/sencode" "$pkgdir/usr/bin/sencode"
}
