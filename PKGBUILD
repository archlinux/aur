# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=codevis
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for turning your code into one large image"
arch=('x86_64')
url="https://github.com/sloganking/codevis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8c31b550b5a73740c8ac1ba117aba3895b35ca5a0b48e02ee6570e52c9a1d11ed217d66a4fcfab41efadcfd6bcaa6265b102733cd78b0d6007939985401fa042')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  # https://github.com/sloganking/codevis/issues/23
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
