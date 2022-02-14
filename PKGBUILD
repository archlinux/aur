# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=bingrep-rs
_pkgname=bingrep
pkgver=0.9.1
pkgrel=1
pkgdesc="Cross-platform binary parser and colorizer"
arch=('x86_64')
url="https://github.com/m4b/bingrep"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/m4b/bingrep/archive/v$pkgver.tar.gz)
sha512sums=('b0f163019c7fcc88749b4f28cd1d80ca26b131226487b0f6f44bf56009765799e8ca44d49d736baac7b2ad5981b5019795f75b857c58bc9b49f1e4f5a89ba38d')

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
