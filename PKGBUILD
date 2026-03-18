# Maintainer: Tal <talwat321@gmail.com>
pkgname=lowfi
pkgver=2.0.5
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('any')
url="https://github.com/talwat/$pkgname"
license=('MIT')
makedepends=('cargo' 'alsa-lib' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('b53cb8b68055e8cf03b8b1e6c97207b24638c29aa8bc9e6bd561fdb478a23ce9fe8b722518ad6d825fab4db0f4f74b883135cd2e0b915e9dd1d709a8b3a4fc70')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/debug/$pkgname"
}

