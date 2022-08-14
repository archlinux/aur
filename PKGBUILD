# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=perseus
pkgver=0.3.5
pkgrel=1
pkgdesc="The CLI for the Perseus frontend framework"
arch=('x86_64')
url="https://github.com/arctic-hen7/perseus"
license=('MIT')
makedepends=('cargo' 'bonnie' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('91fafa505feb0b27dbbc89811ef990ffc12ebc72155d017dfed6ba372a5199ed')
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
