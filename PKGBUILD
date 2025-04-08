# Maintainer: Digua Dong <dongdigua@outlook.com>
pkgname=wl-binclock
pkgver=1.2.1
pkgrel=1
pkgdesc="binary clock for wayland in rust"
arch=('x86_64')
url="https://github.com/dongdigua/wl-binclock"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cb33ea54ffaeaa92aff0902eaa68045b9105515ecd317a09b304ce1004a6340b')

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
