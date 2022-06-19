# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=charcoal
pkgver=0.1.3
pkgrel=1
pkgdesc="Charcoal, a command line dictionary"
arch=('x86_64')
reponame=Charcoal
url="https://github.com/LighghtEeloo/$reponame"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('caec58e82995c8f4822322a6d5e4b5b298bd4c24ed897147c7df782b2d4f3816fb65902eb429854feddb6b87693835847a80b0bdc57a87629ac6b884484db68d')

prepare() {
  mv "$srcdir/$reponame-$pkgver" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/char-coal" -t "$pkgdir/usr/bin"
  install -Dm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
