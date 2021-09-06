# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-msrv
pkgver=0.9.0
pkgrel=1
pkgdesc="Find the minimum supported Rust version (MSRV) for your project"
arch=('x86_64')
url="https://github.com/foresterre/cargo-msrv"
license=('MIT' 'Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f93b2e5bb1a8617bbf2ac2f0a17744b65b3515948a1b3553fc2e89f5d9779c58')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
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
