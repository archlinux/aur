# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=bawa
pkgver=0.1.0
pkgrel=2

pkgdesc='A TUI game save organizer'
url='https://github.com/sarowish/bawa'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afe4c1808604e6be0b42afea43509c76f8ed321d8466b2e1cc37c33106444ad8')

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
