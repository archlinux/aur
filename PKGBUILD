# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passepartui
pkgver=0.1.6
pkgrel=2
pkgdesc="A TUI for pass"
arch=('x86_64')
url="https://github.com/kardwen/passepartui"
license=('MIT')
depends=('gcc-libs' 'gpgme')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2b5dc7e9067cc13a8ca3a6c4be7aaff117b1cceadbf5fcd074bfaa937b0652dbe6c0c2451426b2fc4aae7fa11097fe00e9743f27197a6e5e9cf0ad610e698af5')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
