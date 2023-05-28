pkgname=kalc
pkgver=0.5.3
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ebcbc8ab33cd272026957cad343b7a9ff93333e35650c47c35199cb97615b8d34b77e2a089757295b0d7506808adf3f17885a1d7d1e48356c755191463fc2877')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
