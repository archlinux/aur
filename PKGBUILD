# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=elfx86exts
pkgver=0.3.0
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
makedepends=(cargo)
source=("$pkgname.tar.gz"::https://github.com/pkgw/elfx86exts/archive/v${pkgver}.tar.gz)
sha512sums=('5304e83b4496ac0c2fb4c8dd35e346da814d494aefbbf516dee50c61cbc5477dabfd1c0da09de4e6a513b3ed5861e389a00a984fcbc46d856a69282010fc1607')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/elfx86exts "$pkgdir"/usr/bin/elfx86exts
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
