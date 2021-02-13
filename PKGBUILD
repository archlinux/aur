# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tickrs
pkgver=0.11.0
pkgrel=1
pkgdesc="Realtime ticker data in your terminal"
arch=('x86_64')
url="https://github.com/tarkah/tickrs"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e613ba73e946c5ef36682de1146489fd8543542eb014756111a7bbbeaacf4101c5c2c8c85351e4874b62cc4cf3d6cf3ee29f4eff628cf1944a90103cb6a83943')

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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
