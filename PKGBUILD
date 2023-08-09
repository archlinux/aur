# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-unused-features
pkgver=0.2.0
pkgrel=1
pkgdesc="Find potential unused enabled feature flags and prune them"
arch=('x86_64')
url="https://github.com/TimonPost/cargo-unused-features"
license=('MIT')
depends=('gcc-libs' 'curl' 'zlib' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4b09580b2d72aaec3e8dfb8b36dfb3035ae4f4f87f60e1d0d11e4907c0411fe6')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
 cd "$pkgname-$pkgver"
 cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/unused-features" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
