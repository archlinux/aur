# Maintainer: Dest1n1s <dest1nis2022@gmail.com>

pkgname=sync-rs
pkgver=1.3.6
pkgrel=1
pkgdesc="A CLI tool to sync files between directories"
arch=('x86_64')
url="https://github.com/dest1n1s/sync-rs"
license=('MIT')
depends=('gcc-libs' 'rsync' 'openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dest1n1s/sync-rs/archive/v$pkgver.tar.gz")
sha256sums=('ce7f9c6c871aa76980651c6e6338a3b3f966340a45c4d8d6628e6ed8857bfc62')

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