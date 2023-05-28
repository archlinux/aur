pkgname=kalc
pkgver=0.5.3
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a51fe5e9d56d65574722d6e7a3adb97e26e71d36bcaeb23418f4522fd9a9d23ac89db3a455ba6bc4c4a182e6fc17ea07b98ca03000a1416502a7613168842cb5')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
