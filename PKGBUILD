# Maintainer: Will Daly <will.e.daly@gmail.com>
pkgname=devlog
pkgver=1.0.5
pkgrel=1
pkgdesc="Command-line tool for tracking your day-to-day software development work."
arch=('x86_64')
url="https://github.com/wedaly/devlog"
license=('MIT')
depends=('nano')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedaly/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9aad336f4e978d11c60f31fa7c471bb63083215335405df7339da3dd929d1799df0549d42c69739c7e49fefaad7eee7539215feb8828b35a2bef6001ff481b41')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/devlog" "$pkgdir/usr/bin/devlog"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

