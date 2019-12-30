# Maintainer: Aram Drevekenin <aram@poor.dev>
pkgname=bandwhich
pkgver=0.6.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Display network utilization by process, connection and remote address"
url="https://github.com/imsnif/bandwhich"
source=("https://github.com/imsnif/$pkgname/archive/$pkgver.tar.gz")
license=('MIT')
sha256sums=("b5bef3ecdcace34e5d14ed44449ae1cfc109a0f889817705b53a77259d1714d3")

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
