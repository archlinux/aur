# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping
pkgver=1.1.0
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('47b269891ac3a31ff069fbe04a0fbec55ed86e6cba0e688fb0750ba5e563b89aa3d953ba131c4cb4d6ef4091a3306088ff8fe856073b43191a898d2c4b2e6421')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
