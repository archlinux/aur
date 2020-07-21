# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=bingrep-rs
_pkgname=bingrep
pkgver=0.8.2
pkgrel=1
pkgdesc="Cross-platform binary parser and colorizer"
arch=('x86_64')
url="https://github.com/m4b/bingrep"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/m4b/bingrep/archive/v$pkgver.tar.gz)
sha512sums=('0a239964af5af553d8746824171bb50f55d92de9a43cd6d10dcde0b7c1fe8b35d2719bf35aec92da7a0311aee58bb42c7d1a5b948eeaf9bf0edba92a6fa5e088')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/bingrep "$pkgdir"/usr/bin/bingrep
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
