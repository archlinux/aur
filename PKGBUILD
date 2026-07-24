# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=markdown2pdf
pkgver=1.6.0
pkgrel=1
pkgdesc="Convert markdown to pdf (a md to pdf transpiler)"
arch=('x86_64')
url="https://github.com/theiskaa/markdown2pdf"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('af1a4b12ff5069662475ca028dab0da3121f63997e9ee198f6b6897c6624fc2fc6735d6e1b96a32b5beadb5a3e1dbb1d0b8636ef1e3d65b316026ed2f25e99f4')

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
