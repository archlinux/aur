# Maintainer: Dest1n1s <dest1nis2022@gmail.com>

pkgname=sync-rs
pkgver=1.3.1
pkgrel=1
pkgdesc="A CLI tool to sync files between directories"
arch=('x86_64')
url="https://github.com/dest1n1s/sync-rs"
license=('MIT')
depends=('gcc-libs' 'rsync' 'openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dest1n1s/sync-rs/archive/v$pkgver.tar.gz")
sha256sums=('47a6be085cbd2e62096e1ee4a94e5bc6cb29686daaefd7a866ddffa858f8a1e5')

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