# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.14.0
pkgrel=1
pkgdesc="Workspace productivity booster"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b272c4c9748157e0838d9fd3fe225aadf0136cc419f2c3ba1b9feddfaa38281')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
  cd man
  cargo run > $pkgname.1
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 man/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}
