# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=elfx86exts
pkgver=0.4.0
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pkgw/elfx86exts/archive/v${pkgver}.tar.gz)
sha512sums=('9af20db584cdf14b3b7072e030a6619d10a289e7fc20534fad30ca11a521ea5e69013455e413e847d2023595da12b9ef3523546fa7a20c9d3f402797a65d02e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/elfx86exts "$pkgdir"/usr/bin/elfx86exts
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
