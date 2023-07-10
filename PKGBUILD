# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>

pkgname=foundry
pkgver=v1.0.0
pkgrel=1
pkgdesc="A blazing fast, portable and modular toolkit for Ethereum application development written in Rust."
arch=('x86_64' 'aarch64')
url="https://getfoundry.sh"
license=('MIT' 'APACHE')
depends=(libusb)
makedepends=('git' 'cargo')
provides=(forge cast anvil chisel)
source=("git+https://github.com/foundry-rs/foundry.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd ${pkgname}

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --bins --frozen --release
}

package() {
  cd ${pkgname}

  install -Dm755 "target/release/forge" "$pkgdir/usr/bin/forge"
  install -Dm755 "target/release/cast" "$pkgdir/usr/bin/cast"
  install -Dm755 "target/release/anvil" "$pkgdir/usr/bin/anvil"
  install -Dm755 "target/release/chisel" "$pkgdir/usr/bin/chisel"

  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
