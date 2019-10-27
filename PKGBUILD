# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dasm
pkgver=2.20.11
pkgrel=4
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including 6502, 6507, 6803, HD6303, 68HC11, 68705, and F8"
arch=('x86_64')
url="https://dasm-assembler.github.io/"
source=(https://github.com/dasm-assembler/dasm/archive/${pkgver}.tar.gz)
sha256sums=('c69bbe192159dcf75677ca13bba65c3318dc443f2df45fccd3c060b2e092c7f5')
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

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/dasm"
  install -Dm644 doc/dasm.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/DASM.TXT doc/FTOHEX.TXT "$pkgdir/usr/share/doc/dasm"

  install -dm755 "$pkgdir/usr/include/dasm/atari2600" "$pkgdir/usr/include/dasm/channel-f"
  install -Dm644 Machines/ATARI2600/* "$pkgdir/usr/include/dasm/atari2600"
  install -Dm644 Machines/CHANNEL-F/* "$pkgdir/usr/include/dasm/channel-f"
}
