pkgname=kalc
pkgver=0.5.6
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8abba9dfd4cfa01ca76b3cea95a580a6ea8bbbecd905a4f1948107c412c45f0b00d13ca2b3a2be6889e0783a0d9cbf73969653176f365f24b91522f140e14fa1')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
