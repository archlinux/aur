# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=perseus
pkgver=0.4.0
pkgrel=1
pkgdesc="The CLI for the Perseus frontend framework"
arch=('x86_64')
url="https://github.com/arctic-hen7/perseus"
license=('MIT')
makedepends=('cargo' 'bonnie' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c8ef894409e6812f09cdf6e011f6b18a67fe5b00d9d95965ef9fde7daebd9b0')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver/packages/$pkgname-cli"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  bonnie setup
  cd "$srcdir/$pkgname-$pkgver/packages/$pkgname-cli"
  cargo build --release
}

#check() {
  #cd "${pkgname%-cli}-$pkgver/packages/$pkgname"
  #cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
