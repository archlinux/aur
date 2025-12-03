# Maintainer: saxamaxas <sakshyamsigdel@gmail.com>
pkgname=hyprdrover
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight session manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/S-Sigdel/hyprdrover"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab39f4005dc16c11a0a3ee290ba9aa38630ac0b8e7c5ec020f3f4ef4bb2a200c')

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
