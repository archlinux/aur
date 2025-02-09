# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbassopus
pkgver=2.4.3
pkgrel=2
pkgdesc='BASS audio library Opus plugin'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib libbass)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bassopus24-linux.zip")
sha256sums=('97b036a27afb78257ee4e96f2f1ab629baa5496475562a905603944af7ec5cbd')

prepare() {
  grep Lic "$srcdir/bassopus.txt" -A14 > LICENSE
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libs/x86/libbassopus.so "$pkgdir/usr/lib/libbassopus.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 libs/armhf/libbassopus.so "$pkgdir/usr/lib/libbassopus.so"
	  ;;
    aarch64|x86_64)
      install -D -m644 libs/$CARCH/libbassopus.so "$pkgdir/usr/lib/libbassopus.so"
	  ;;
  esac

  install -D -m644 bassopus.h "$pkgdir/usr/include/bassopus.h"
  install -D -m644 bassopus.chm "$pkgdir/usr/share/doc/libbassopus/bassopus.chm"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
