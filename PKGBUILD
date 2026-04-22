pkgname=bitclk
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal binary clock with runtime toggle between binary and normal modes"
arch=('x86_64')
url="https://github.com/heyifan142857/bitclk"
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/bitclk "$pkgdir/usr/bin/bitclk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
