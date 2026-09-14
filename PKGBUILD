# Maintainer: Nico <54544490+dserv-nh@users.noreply.github.com>

pkgname=eitype
pkgver=0.2.2
pkgrel=1
pkgdesc='Type text on Wayland through the Emulated Input protocol'
arch=('x86_64')
url='https://github.com/Adam-D-Lewis/eitype'
license=('Apache-2.0')
depends=('glibc' 'libxkbcommon')
makedepends=('cargo')
source=("https://static.crates.io/crates/eitype/eitype-${pkgver}.crate")
sha256sums=('d23fca608db0989e00cd562a8966ee6b5192f07ec84ed1a4564909d146b54471')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --no-default-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/eitype" "$pkgdir/usr/bin/eitype"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
