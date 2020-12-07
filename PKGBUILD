# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=color_blinder
pkgver=1.0.0
pkgrel=1
pkgdesc="Simulate different kinds of color blindness with a set of images"
arch=('x86_64')
url="https://gitlab.com/dns2utf8/color_blinder"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('460df56c90ea553d5bcfb9fa6347a0f59dd3b9554cec0582e903021854755ad8329a859a3dd942ce8c522432a06391f447ee60ee5f5a7144ae0bf5ee3dd46508')

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
