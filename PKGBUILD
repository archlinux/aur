# Maintainer: Digua Dong <dongdigua@outlook.com>
pkgname=wl-binclock
pkgver=1.3.0
pkgrel=1
pkgdesc="binary clock for wayland in rust"
arch=('x86_64')
url="https://github.com/dongdigua/wl-binclock"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da3b6002d76d95ca96d2790cf4b5f13ffac12150f0a7b27836d3ce6de61bbf00')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
