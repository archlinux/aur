# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass
pkgver=2.4.18.3
pkgrel=1
pkgdesc='BASS audio library'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bass24-linux.zip")
sha256sums=('9bf723dbf750d665c14cfc099f96a056483dc35de6850d2df76af8b640435ca9')

prepare() {
  grep Lic "$srcdir/bass.txt" -A62 > LICENSE.bass
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libs/x86/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 libs/armhf/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    aarch64|x86_64)
      install -D -m644 libs/$CARCH/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
  esac

  install -D -m644 c/bass.h "$pkgdir/usr/include/bass.h"
  install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
  install -D -m644 LICENSE.bass "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
