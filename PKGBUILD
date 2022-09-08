# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.16.1
pkgrel=1
pkgdesc="Workspace productivity booster"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2d77ce6673e48dd8f20ee42d8a64a0cbe648d51b837cb930b69c3707718659c2')

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
