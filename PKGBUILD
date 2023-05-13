# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbassflac
pkgver=2.4.5.2
pkgrel=1
pkgdesc='BASS audio library FLAC plugin'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib libbass)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bassflac24-linux.zip")
sha256sums=('322aeb03fa035334a08163ced9f8f91764bed8e29c77b0ac4d3f5efbddc59d88')

prepare() {
  grep Lic "$srcdir/bassflac.txt" -A14 > LICENSE
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libs/x86/libbassflac.so "$pkgdir/usr/lib/libbassflac.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 libs/armhf/libbassflac.so "$pkgdir/usr/lib/libbassflac.so"
	  ;;
    aarch64|x86_64)
      install -D -m644 libs/$CARCH/libbassflac.so "$pkgdir/usr/lib/libbassflac.so"
	  ;;
  esac

  install -D -m644 bassflac.h "$pkgdir/usr/include/bassflac.h"
  install -D -m644 bassflac.chm "$pkgdir/usr/share/doc/libbassflac/bassflac.chm"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
