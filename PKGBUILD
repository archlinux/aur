pkgname=rnum
pkgver=0.1.5
pkgrel=1
pkgdesc="Rational numbers REPL calculator written in Rust"
arch=('x86_64')
url="https://github.com/davide-leva/rnum"
license=('MIT')
makedepends=('cargo')
options=('!debug')
source=("https://github.com/davide-leva/rnum/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --jobs "$(nproc)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
