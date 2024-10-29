# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.9
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc='A sound and fast distributed version control system'
arch=('x86_64')
url='https://pijul.org'
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('5e4facce9b1620b1ea31d6735ccb5fb0f862f7039cf88b63b4bafb8f5efd7de2a8610cd0cf5b3fcf555a25f6df3fd9d8ea9b34dc439d235b3b87345651402123')
b2sums=('9afcc924be55c1cbdf7723f41c4cca029a326cc9f1897ddc63108baee4c0e21a7a41b66a60a0d01c117dc76ea60d672636cbe9f627ab978bf4bb78d0f92d2e1f')

prepare() {
  cd "$pkgname-$_pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --frozen --all-features
}

package() {
  cd "$pkgname-$_pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
