# Maintainer: Carlo Abelli <carlo@abelli.me>

pkgname=sirula
pkgver=1.1.0
pkgrel=1
pkgdesc="An app launcher for wayland"
arch=(x86_64)
url=https://github.com/DorianRudolph/sirula
license=(GPL-3.0-or-later)
depends=(gtk-layer-shell)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DorianRudolph/sirula/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(f6ccebf26a01bcc1b8472f9695186a599274c1d10026a1d8638b6966733434e5)

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
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/sirula"
}
