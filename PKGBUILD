# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hextazy
pkgver=0.8.4
pkgrel=1
pkgdesc="A coloful hexadecimal editor"
arch=('x86_64')
url="https://github.com/0xfalafel/hextazy"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a406b0edac795fff5cf91c99916ec7ee715e68158bfac2b4a2045dc09a492d3385c519beb2b2323052163053b1d8ffb2716042416bb1af0ed3b6a6d55d44fef5')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
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
