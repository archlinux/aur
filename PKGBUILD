pkgname=kalc
pkgver=0.5.4
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e267c28301b3df591743a29af63314348411abd5edf68489eaa2df390b01c399496453df4a3bbf1c2383c9deabf55dbec8d23c6ed6915939136ede1bbe7219ed')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
