# Maintainer: Aram Drevekenin <aram@poor.dev>
pkgname=what
pkgver=0.4.0
pkgrel=3
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Display network utilization by process, connection and remote address"
url="https://github.com/imsnif/what"
source=("https://github.com/imsnif/$pkgname/archive/$pkgver.tar.gz")
license=('MIT')
sha256sums=("a8bfa43e3e55bb262aef458e9b0a8858c77f13521ddd2998d500a5acd9a9ed9c")

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
