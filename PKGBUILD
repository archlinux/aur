# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lipl
pkgver=0.1.2
pkgrel=1
pkgdesc="Analyse the output over time of custom shell commands"
arch=('x86_64')
url="https://github.com/yxdunc/lipl"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d19c0419e45dcb6f03b6f70778c1887bc9f295da65ff2656c886e1c5dc02472b03b4cc82446ef04c12231823af2a3505db36339e60f71a0e25ed9e11030c92b2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
