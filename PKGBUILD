# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=jilu
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate a change log based on the state of your Git repository"
arch=('x86_64')
url="https://github.com/rustic-games/jilu"
license=('Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5487b640bfb98a17c3e223fe23093fa6e3173db92647ccd85033c71917ce14c965eaad1f8314561d1c35257382e350fa34aa5faab923431d5945081ca857da07')

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
}
