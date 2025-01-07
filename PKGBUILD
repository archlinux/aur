# Maintainer: Tal <talwat321@gmail.com>
pkgname=lowfi
pkgver=1.5.5
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('any')
url="https://github.com/talwat/$pkgname"
license=('MIT')
makedepends=('cargo' 'alsa-lib' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('bd99bed34f0e650d43fb55c1f450566c4c7532aef3106ce281f821b1070d2e6ae5f4186e4e46429351a497527e5258d6353690fc9b1dad19221486068961ba4c')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

