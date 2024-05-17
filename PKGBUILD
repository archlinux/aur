# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wiper
pkgver=0.1.0
pkgrel=1
pkgdesc="Disk cleanup tool"
arch=('x86_64')
url="https://github.com/ikebastuz/wiper"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0fbb21cb84fdc019549097a8efa3371e27105bdb48437723941c6b41c9914518dbf5d122eb851b99dd06c3b5daba64a24a849add65def220e67472f3ffe508ca')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  # install -Dm 644 License -t "$pkgdir/usr/share/licenses/$pkgname"
}
