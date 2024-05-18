# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wiper
pkgver=0.1.1
pkgrel=1
pkgdesc="Disk cleanup tool"
arch=('x86_64')
url="https://github.com/ikebastuz/wiper"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('620dffad02072c0022ffe56295275b1eac2e1530a04647fe01a4280842ee1a8fab79d9b7a4b0c7ccf834ed50e214b6fc8ec6e39def971a073171f5bb7525e834')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
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
  install -Dm 644 License -t "$pkgdir/usr/share/licenses/$pkgname"
}
