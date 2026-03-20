# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.14.4
pkgrel=1
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
options=(!lto)
makedepends=('rust')
source=("source-$pkgver.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('68e24826345dcf39fbcbc0e417e7382c86dd2b4d216ae9cc93b9aaa98b0216373a5f25e2998e72eee1e8f8be08727550a90fd9c167a94b6a7604f82ce6eb15e8')

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
