# Maintainer: Okazakee <okazakee@proton.me>
pkgname=tuxfans
pkgver=0.3.0
pkgrel=1
pkgdesc="Fan curve controller for TUXEDO laptops"
arch=('x86_64')
url="https://github.com/Okazakee/tuxfans"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Okazakee/tuxfans/archive/v$pkgver.tar.gz")
sha256sums=('bfaa4adcf32b18628b7055123b0236c81904da03de6f1a036294c805bc3fa4fc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # --locked uses the shipped Cargo.lock; not --frozen, so a clean chroot
  # (empty cargo cache) can still fetch its dependencies.
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/tuxfans "$pkgdir/usr/bin/tuxfans"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
