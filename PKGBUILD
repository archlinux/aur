# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.6
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
sha512sums=('d7df3604fefe82214a29143bcfcbc08aa9b42b55cfefc6a44afbe7aab8a0ec0f83f7e751707784bd519c008eb1bbfbfb134d7cf3ffad2214a8641cec52d96754')
b2sums=('e8168e25057e3bd6156dddefd6a0b43ceb6de70f47b2fadd42b6c322b517376284100ce47dd083072b7266dfd4d97d30c77d79757c0df297ed153738fbc9f72b')

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
