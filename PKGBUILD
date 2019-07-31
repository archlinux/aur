# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dasm
pkgver=2.20.11
pkgrel=3
_relyear=2014
_relmonth=03
_relday=04
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including 6502, 6507, 6803, HD6303, 68HC11, 68705, and F8"
arch=('x86_64')
url="http://dasm-dillon.sourceforge.net/"
source=(https://downloads.sourceforge.net/project/dasm-dillon/dasm-dillon/${pkgver}/${pkgname}-${pkgver}-${_relyear}.${_relmonth}.${_relday}-source.tar.gz)
sha256sums=('a9330adae534aeffbfdb8b3ba838322b92e1e0bb24f24f05b0ffb0a656312f36')
license=('GPL2')
provides=('dasm' 'ftohex')
depends=('glibc')
makedepends=('gcc')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${_relyear}${_relmonth}${_relday}"
  make
}

package() {
  cd "$srcdir/dasm-${pkgver}-${_relyear}${_relmonth}${_relday}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 bin/dasm bin/ftohex "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/dasm"
  install -Dm644 doc/dasm.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/dasm.txt doc/ftohex.txt "$pkgdir/usr/share/doc/dasm"

  install -dm755 "$pkgdir/usr/include/dasm/atari2600" "$pkgdir/usr/include/dasm/channel-f"
  install -Dm644 machines/atari2600/* "$pkgdir/usr/include/dasm/atari2600"
  install -Dm644 machines/channel-f/* "$pkgdir/usr/include/dasm/channel-f"
}
