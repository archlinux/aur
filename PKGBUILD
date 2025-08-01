# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=markdown2pdf
pkgver=0.1.6
pkgrel=1
pkgdesc="Convert markdown to pdf (a md to pdf transpiler)"
arch=('x86_64')
url="https://github.com/theiskaa/markdown2pdf"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('929ef17bd4f17dfb8816301acad66a4be16f7a997df286e5870535c357a17b6e084f2b05a8dfc0131d4ff2fae33f8464de0f0fbf24634f98861eaa3bf0ffcd8c')

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
