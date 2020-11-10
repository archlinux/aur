# Maintainer: Patrick Haun <bomgar85 at googlemail dot com>

pkgname=dotcopter
pkgver=0.5.0
pkgrel=1
pkgdesc="A small tool to manage dotfile installation."
arch=('x86_64')
url="https://github.com/bomgar/dotcopter"
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('009a83748c0b72dc052d93e26d0267f8a93bbdb77487e91bd8c54ae635d5fbea')

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
  install -Dm 644 README.org -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
