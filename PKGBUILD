# Maintainer: Gopal Lohar <gopal.lohar.dev@gmail.com>

pkgname=bettery
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal TUI battery manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/gopal-lohar/bettery"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gopal-lohar/bettery/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/bettery -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/bettery"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bettery" 2>/dev/null || true
}
