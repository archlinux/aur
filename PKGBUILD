# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dasm
pkgver=2.20.14.1
pkgrel=1
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including 6502, 6507, 6803, HD6303, 68HC11, 68705, and F8"
arch=('x86_64')
url="https://dasm-assembler.github.io/"
source=(https://github.com/dasm-assembler/dasm/archive/${pkgver}.tar.gz)
sha256sums=('ec71ffd10eeaa70bf7587ee0d79a92cd3f0a017c0d6d793e37d10359ceea663a')
license=('GPL2')
provides=('dasm' 'ftohex')
depends=('glibc')
makedepends=('gcc')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/dasm-${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 bin/dasm bin/ftohex "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/docs/dasm"
  install -Dm644 docs/dasm.txt docs/ftohex.txt "$pkgdir/usr/share/docs/dasm"

  install -dm755 "$pkgdir/usr/include/dasm/atari2600" "$pkgdir/usr/include/dasm/channel-f"
  install -Dm644 machines/atari2600/* "$pkgdir/usr/include/dasm/atari2600"
  install -Dm644 machines/channel-f/* "$pkgdir/usr/include/dasm/channel-f"
}
