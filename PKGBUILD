# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hoard
pkgver=1.4.1
pkgrel=1
pkgdesc="A CLI command organizer written in Rust"
arch=('x86_64')
url="https://github.com/Hyde46/hoard"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8865eac3ee595c6c7acfcc5967d39bc0af9de65fdea3787b81b5d4073f1d8c69')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "src/shell/$pkgname.bash" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "src/shell/$pkgname.zsh" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "src/shell/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
