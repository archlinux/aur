# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.6.1
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a820a6de209e76b6b977aa330a6790d3025de8ec012cd1b65b024d9f0dcbceb7365f5ce7509804b7b1d3dd97b7beaaaf1ca7c8d2e7e712dfb0563126433140ec')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/battered" "$pkgdir/usr/bin/battered"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

