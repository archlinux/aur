# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=bawa
pkgver=0.1.0
pkgrel=1

pkgdesc='A TUI game save organizer'
url='https://github.com/sarowish/bawa'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('195793aafa5d35acd41ddd510311b0e870d37e8e71ba9af69a5f262b376c3812')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
