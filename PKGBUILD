# Maintainer: Aram Drevekenin <aram@poor.dev>
pkgname=bandwhich
pkgver=0.7.0
pkgrel=0
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Display network utilization by process, connection and remote address"
url="https://github.com/imsnif/bandwhich"
source=("https://github.com/imsnif/$pkgname/archive/$pkgver.tar.gz")
license=('MIT')
sha256sums=("6f08b0e1bf07fc8397bf9d4c5e8211368dbbcad4c0cfc2c369066f711a343152")

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bandwhich" "$pkgdir/usr/bin/bandwhich"
  install -Dm644 "docs/bandwhich.1" "$pkgdir/usr/share/man/man1/bandwhich.1"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
