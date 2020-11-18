# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping
pkgver=0.1.7
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('acdf605d6f2fc32c6e468abf287caa7569d5f018d4d2cdec47de77a065db1c99311e2caa786fb4fa2705db362df1fbbdfc7c9f4d88628cec3afdafb7ca1911c2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
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
