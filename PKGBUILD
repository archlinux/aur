# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=color_blinder
pkgver=1.0.2
pkgrel=1
pkgdesc="Simulate different kinds of color blindness with a set of images"
arch=('x86_64')
url="https://gitlab.com/dns2utf8/color_blinder"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d81ad0ac8dfbbf3a921ae5d857b5dde997368bb30e6aa733257de242a7135507322ca85b0fb184e762b80cd940c7ec7f822b1a23b93223b933dffe9c7839fda6')

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
