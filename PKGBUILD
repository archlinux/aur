pkgname=kalc
pkgver=0.5.4
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
