# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tickrs
pkgver=0.9.0
pkgrel=1
pkgdesc="Realtime ticker data in your terminal"
arch=('x86_64')
url="https://github.com/tarkah/tickrs"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9d1a27f28a96549aa790569d48c2990b461b36bfaed09fd5261e3306f97ade9de3ec9c294e33df921f50beab4c867f0376657bff72b3ff99ff42e7093cce9d8b')

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
