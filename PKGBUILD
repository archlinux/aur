# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passepartui
pkgver=0.1.7
pkgrel=1
pkgdesc="A TUI for pass"
arch=('x86_64')
url="https://github.com/kardwen/passepartui"
license=('MIT')
depends=('gcc-libs' 'gpgme')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cf39da078a08f7c6385958c0e11c2a9dcf8caffa84d69a5ec2990d394df8fa13591910e5ef8b6def6a199410fcff5e54a3f1ef4642a850917cd0dda595ffce46')

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
