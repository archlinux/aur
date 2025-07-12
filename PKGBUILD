# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.12.2
pkgrel=1
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
options=(!lto)
makedepends=('rust')
source=("source-$pkgver.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("caafdbe8eea73312634e0e21f43fe2e0f8ec5aa673d89be4f1049b507d9214771bbbe9a6e9e197a2912cb3c4bc0dd4e49ca8ac60ee0d806ea79370d5f8280ea0")

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
