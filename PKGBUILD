pkgname=mongodbtui
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal UI for MongoDB written in Rust"
arch=('x86_64')
url="https://github.com/vehbican/mongodbtui"
license=('MIT')

depends=('gcc-libs')

makedepends=(
  'cargo'
  'clang'
  'lld'
  'perl'
  'nasm'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo clean

  export CC=clang
  export CXX=clang++
  export RUSTFLAGS="-C link-arg=-fuse-ld=lld"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 \
    target/release/mongodbtui \
    "$pkgdir/usr/bin/mongodbtui"
}
