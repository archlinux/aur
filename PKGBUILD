# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbasswv
pkgver=2.4.7.4
pkgrel=1
pkgdesc='BASS audio library WavPack plugin'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib libbass)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/basswv24-linux.zip")
sha256sums=('d2d6bd471fd81d7b4be2002f282c81bc12d6677cec97fad3beb9c28fb8da9e9d')

prepare() {
  grep Lic "$srcdir/basswv.txt" -A14 > LICENSE
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libs/x86/libbasswv.so "$pkgdir/usr/lib/libbasswv.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 libs/armhf/libbasswv.so "$pkgdir/usr/lib/libbasswv.so"
	  ;;
    aarch64|x86_64)
      install -D -m644 libs/$CARCH/libbasswv.so "$pkgdir/usr/lib/libbasswv.so"
	  ;;
  esac

  install -D -m644 basswv.h "$pkgdir/usr/include/basswv.h"
  install -D -m644 basswv.chm "$pkgdir/usr/share/doc/libbasswv/basswv.chm"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
