# Maintainer: saxamaxas <sakshyamsigdel@gmail.com>
pkgname=hyprdrover
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight session manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/S-Sigdel/hyprdrover"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d4ba2aca029bc97bf328a2887b27bce19e3444c9647ce8f3b583935cc21e8cb')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
