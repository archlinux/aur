# Maintainer: Tal <talwat321@gmail.com>
pkgname=lowfi
pkgver=1.7.2
pkgrel=2
pkgdesc="An extremely simple lofi player."
arch=('any')
url="https://github.com/talwat/$pkgname"
license=('MIT')
makedepends=('cargo' 'alsa-lib' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('6731344af46c472e6657285a2ed9b0348422747543de822c0628562212a63d074fd7b739effbbe09853b050064141e658da7456d9b04b97778cd3ef5753cba6a')

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

