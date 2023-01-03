# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hoard
pkgver=1.3.0
pkgrel=2
pkgdesc="A CLI command organizer written in Rust"
arch=('x86_64')
url="https://github.com/Hyde46/hoard"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4989ca2ae4ae7344dbc46cdd30d130901d49d27f6bedee0656c33d3b05edca90')

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
