# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=markdown2pdf
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert markdown to pdf (a md to pdf transpiler)"
arch=('x86_64')
url="https://github.com/theiskaa/markdown2pdf"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c425f1a17dec5e77dae8a37279d73a7c46ab42e7c9ea5016a1d513ec081d5badba74fe96bd07ce40fe10902136f9ccf15e784819420d042ce3dc2ffbf49397b5')

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
