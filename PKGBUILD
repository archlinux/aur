# Maintainer: Javier Tia <javier.tia@gmail.com>
pkgname=commitmsgfmt
pkgver=1.6.0
pkgrel=1
pkgdesc="Formats commit messages better than fmt(1) and Vim"
url="https://github.com/commonquail/commitmsgfmt"
arch=("any")
license=("MIT")
makedepends=('rust')
source=("source-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('19e08a913aedeece681edd85874a3b9bc215dae6918823f0bb7d1ed5bac37ef197e9f5d20188f0657c886b27754ea60735f31171f6a1d19fd54814a7279c1c30')

prepare() {
  mv $pkgname-$pkgver/* .
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
