# Maintainer: notliad <notliad at users dot noreply dot github dot com>
# Contributor: notliad <notliad at users dot noreply dot github dot com>

pkgname=notahub
pkgver=0.1.0
pkgrel=1
pkgdesc="A keyboard-driven TUI for managing projects and ideas in plain markdown"
arch=('x86_64')
url="https://github.com/notliad/notahub"
license=('custom')
depends=()
makedepends=('cargo')
source=("https://github.com/notliad/notahub/archive/v$pkgver.tar.gz")
sha256sums=('2c0e59c2c2de2c8fe370e61415d346e472bc2f43bb9583d23f39a3b6ee58f453')
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
