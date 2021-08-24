# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mdbook-linkcheck
pkgver=0.7.4
pkgrel=1
pkgdesc="A mdbook backend which will check all links in a document are valid"
arch=('x86_64')
url="https://github.com/Michael-F-Bryan/mdbook-linkcheck"
license=('MIT')
depends=('mdbook')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('573690798277375c2b8fd38a466a35e4fb951cabd016d47930b9fbe4d357f23cc48bb9083d11ec508000eed99276fd9940b30840f3c3b6edaed1408e894e0069')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
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
