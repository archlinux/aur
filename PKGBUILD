# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.4
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
sha512sums=('7b3ddd8b90a82c6cc92e6e5999c1b6bdc41b984ed4e0dd0a8fc229c3d077e57c42392e6b678e4a9706d86987e39b25bfe79f39b770cfb1840f98772c491b65a8')
b2sums=('4fe6721675c765d48ac2dfa9822184e77484614f85ef4d8fa1f95702f138d7ef235b5272701b684122d87d06e1b901418f70198ab2de5889530a6bde68c8493e')

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
