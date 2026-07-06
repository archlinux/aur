# Maintainer: Nekef Chk, nekef@duck.com
pkgname=envdiff
pkgver=0.2.0
pkgrel=1
pkgdesc="A sleek CLI tool to compare and sync .env files with templates"
arch=('x86_64')
url="https://github.com/nekef/envdiff"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06e0f528536043b76a54a1aec14b66cd49f9e1bb34b9d6e14287ab52b254dc8a')

prepare() {
  cd "$pkgname-$pkgver"
  # Clean up and force lock validation
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  # Target local optimizations
  CARGO_TARGET_DIR=target cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  # Install the compiled binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
