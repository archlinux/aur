# Maintainer: Aram Drevekenin <aram@poor.dev>
pkgname=what
pkgver=0.5.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Display network utilization by process, connection and remote address"
url="https://github.com/imsnif/what"
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
  install -Dm755 "target/release/what" "$pkgdir/usr/bin/what"
  install -Dm644 "docs/what.1" "$pkgdir/usr/share/man/man1/what.1"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
