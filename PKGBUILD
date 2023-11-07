# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.7
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc='A sound and fast distributed version control system'
arch=('x86_64')
url='https://pijul.org'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('2055108d8a5ba3fee148e46eb3f7000995c6aac5055ae85a783093114f70a24ad7ddb38ba6d9e7c2d8998d6ff7956e42b711040f251863416ba842e590cc56d6')
b2sums=('500afd8d0867d5135d90f3295efaba151f2913dacc4f30ba3973b5b1546167dcb5803e19f0335e0f7dfdcd1bffd405c70e928207ee35011ef738c55f4359b4fd')

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
