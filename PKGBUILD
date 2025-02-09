# Maintainer: Tal <talwat321@gmail.com>
pkgname=lowfi
pkgver=1.5.6
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('any')
url="https://github.com/talwat/$pkgname"
license=('MIT')
makedepends=('cargo' 'alsa-lib' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2005d4b5e69d2d0f963468ef00c4506362d475bd957b088fab7d94210be9f5d4a2f340489e9b121df95ba192d951db37f2c599b7598fafb6f39c72dd3c7c806a')

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

