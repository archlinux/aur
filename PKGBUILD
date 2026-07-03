# Maintainer: notliad <notliad at users dot noreply dot github dot com>
# Contributor: notliad <notliad at users dot noreply dot github dot com>

pkgname=notahub
pkgver=0.1.1
pkgrel=5
pkgdesc="A keyboard-driven TUI for managing projects and ideas in plain markdown"
arch=('x86_64')
url="https://github.com/notliad/notahub"
license=('custom')
depends=()
makedepends=('cargo')
source=("https://github.com/notliad/notahub/archive/v$pkgver.tar.gz")
sha256sums=('9960a29dc12d5c2c926e136f9cacaab8c8ed3baaffd570a4b33f2a5e8c344c5b')
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
