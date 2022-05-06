# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.2
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('glibc' 'gcc-libs' 'zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('9e3b442c260b72398fe944640c9c6bec969de8191f92b799054e2693293892ed585d47cc06bdab0515d4881d145d4f829551d878131bc587870bb410ada2d4a2')
b2sums=('5282012ea7716550b4a42e4880d9ba54013fc59301c7fb6757cded5edf5e4ba3e66320cb6be170fc00e00e1fe5bed24d08a22a9072617d68d5d0afd5cab2fb96')

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
