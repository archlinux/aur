# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=markdown2pdf
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert markdown to pdf (a md to pdf transpiler)"
arch=('x86_64')
url="https://github.com/theiskaa/markdown2pdf"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fa89bab8e4ebb52f6f61e4f28ebcf45ad3a9115284c892d8e9ee507b7564b2e868c24c6a75e2de49a79d8bb8479a12010439289a90cea1972fbb5a375bbf521a')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
