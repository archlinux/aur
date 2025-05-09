# Maintainer: Dest1n1s <dest1nis2022@gmail.com>

pkgname=sync-rs
pkgver=1.2.18
pkgrel=1
pkgdesc="A CLI tool to sync files between directories"
arch=('x86_64')
url="https://github.com/dest1n1s/sync-rs"
license=('MIT')
depends=('gcc-libs' 'rsync' 'openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dest1n1s/sync-rs/archive/v$pkgver.tar.gz")
sha256sums=('9d85fbbf841042e1611f5265c1c376045a5a135465a305a80a9a83be3fe7b6fd')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 