# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tickrs
pkgver=0.14.0
pkgrel=1
pkgdesc="Realtime ticker data in your terminal"
arch=('x86_64')
url="https://github.com/tarkah/tickrs"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fea3317296279d5ce1c4e59b38ff5f96d493d1a950dfbad99f618fb9560f6a8ce538822bc0c792c67a6c7541e1e3bf16431b28fb78dc11f9e08040fc9cd19a92')

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
