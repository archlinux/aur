# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mdbook-man
pkgver=0.1.0
pkgrel=1
pkgdesc="A mdbook backend that generates man pages"
arch=('x86_64')
url="https://github.com/vv9k/mdbook-man"
license=('MIT')
depends=('gcc-libs' 'mdbook')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('0f14203e3ce002133ce8f7aa6a729aa26979d69519b41a4d47bc2cd0c0bd0377a9e72b70dc2f73c23ca095f5f18ec1e5a5045fe65ec87a877af479ded7128a79')
b2sums=('7f2e05d06c667ae17d90e6d45af6179e2b0e0479322d7635ae0fee3a23efb5c51a97ccebaef8fb3c5f2e657f36b23726f436dc371ba302d6bad65e24bac8584b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
