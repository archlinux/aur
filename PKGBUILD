# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones
pkgver=0.17.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a6d9f9503b8ac17b5c0d6814027ebdc7da0ed2d713d68bcbc23718e30a969385d27ad6988f7e664e24b02fc69cd3cbfca88f8da2718f36b7684f8ee2af6eb547')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
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
