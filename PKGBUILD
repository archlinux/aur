pkgname=kalc
pkgver=0.5.5
pkgrel=1
pkgdesc="a complex numbers, graphing, cli calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6a033dc7e08d586883e0543a6ce09b27a39db3fbcd5ac70a4af2167875041e82720c2e0962ba54004bbbac9b8bf24c233520263a5e07b4df46d98b447f5e48c9')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="-C strip=symbols -C codegen-units=1 -C opt-level=3 -C embed-bitcode=y -C lto=y"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
