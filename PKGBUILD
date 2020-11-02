# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy
pkgver=0.1.9
pkgrel=1
pkgdesc="Bare-bones SSH launcher"
arch=('x86_64')
url="https://github.com/xvxx/shy"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b88d117158c520d773c7fa6d4a11b5afaa474a353d2ea0a376beeed55c1ea7fad4abe6666c3d3cf11b591f2c05a22958c769cf206358be73cadd4c22e4969da1')

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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "doc/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
