# Maintainer: Brocode <bros at brocode dot sh>

pkgname=goat
pkgver=0.10.0
pkgrel=2
pkgdesc="better sleep"
arch=('x86_64')
url="https://github.com/brocode/goat"
license=('custom:WTFPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab0ecf9c43b581b3b5658657c0a5006397176016222d253a175a5a9c974f6818')

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
