# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.19.1
pkgrel=1
pkgdesc="Workspace productivity booster"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f949c3e29e11688c3ab2a7448b9fea2caf07d89d95da7bef00976541f4d957e7')

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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 man/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}
