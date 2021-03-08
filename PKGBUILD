# Maintainer: Will Daly <will.e.daly@gmail.com>
pkgname=devlog
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line tool for tracking your day-to-day software development work."
arch=('x86_64')
url="https://github.com/wedaly/devlog"
license=('MIT')
depends=('nano')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedaly/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('5784b8e8aa4832a9e1e8f6c0ec6e93f23dd120d26badd2e446522dde7d3f5988db62a26516fe11cfbeeb5e44239ca9980d51f782b3728ae39fe2ddfa4cc63f17')

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

