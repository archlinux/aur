# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-msrv
pkgver=0.6.0
pkgrel=1
pkgdesc="Find the minimum supported Rust version (MSRV) for your project"
arch=('x86_64')
url="https://github.com/foresterre/cargo-msrv"
license=('MIT' 'Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3705412ba49fcf2082ff44145b5071dc82722449d14283f2b6232dc92fb0b92d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all
}

# tests are using rustup
#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --release --locked --all -- --test-threads=1
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
