# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.8
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
sha512sums=('eca5190ca0b7bf6a79823319793c32e372231d76508d5ff3278a767641305377893a98a9959a4a7c3e6ffca7c4ee1d1bd3828837e5e08ed44d69ec9263963432')
b2sums=('1a9a6c55cc4ceee30a0815fd6dc0c0ceacde48c72ffcbc846d87c0c71fc86791855c61eb3fde440064fe1661b06794fbeff1d261a11ca3539caabbb37845335e')

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
