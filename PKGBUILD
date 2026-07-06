# Maintainer: Nekef Chk, nekef@duck.com
pkgname=envdiff
pkgver=0.1.0
pkgrel=1
pkgdesc="A sleek CLI tool to compare and sync .env files with templates"
arch=('x86_64')
url="https://github.com/nekef/envdiff"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b45f68167065e797f34f4400a7eb76fb059da65fc42b953081360d2d0482c3c1')

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
