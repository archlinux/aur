# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=markdown2pdf
pkgver=0.1.7
pkgrel=1
pkgdesc="Convert markdown to pdf (a md to pdf transpiler)"
arch=('x86_64')
url="https://github.com/theiskaa/markdown2pdf"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('51928a6366d6cc91ed8c68a171f2497b57d658349f83b96eb4b8d7d8eba38b96363411da4c8c83d46dbff206a5b42020cbebf92949d69302376e88b7ce5aa77a')

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
