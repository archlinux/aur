# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy
pkgver=0.1.10
pkgrel=2
pkgdesc="Bare-bones SSH launcher"
arch=('x86_64')
url="https://github.com/xvxx/shy"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('57f999c67fc967ea924f1fc510024d7c689a7fe49d95157f3540ed7e8ea60d4aecd23f345fd9a611ca33bbb7102c60740db406cad8e715804bf24c13c0a31885')

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
  install -Dm 644 "doc/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
