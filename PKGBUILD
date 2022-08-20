# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.16.0
pkgrel=1
pkgdesc="Workspace productivity booster"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d09a17d56584fd072385ac61c47da0648cfc0223ec6eea121088bce1d2b12e9')

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
