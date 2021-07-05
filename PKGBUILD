# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.50
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('cargo' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('9a93f1e101acc6703ffa9558245a73134b066a43ec2f69c92c88941b5976e26edd27692465adcf361b5ea53f0aff557be018c2a63f5d89e1cff17057bd5ddc93')

build() {
  cd "$pkgname-$_pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -vDm755 "$pkgname-$_pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
