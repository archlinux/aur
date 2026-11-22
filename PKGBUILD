# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbassflac
pkgver=2.4.6.1
pkgrel=1
pkgdesc='BASS audio library FLAC plugin'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(
  alsa-lib
  libbass
)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bassflac24-linux.zip")
sha256sums=('3b42ca51bc5376576314f3cae6d7ea419610d56e254591bf988987a7eafb2861')

prepare() {
  grep ^Licence "$srcdir/bassflac.txt" -A14 > LICENSE
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

  install -D -m644 c/bassflac.h "$pkgdir/usr/include/bassflac.h"
  install -D -m644 bassflac.chm "$pkgdir/usr/share/doc/libbassflac/bassflac.chm"
  install -D -m644 bassflac.txt "$pkgdir/usr/share/doc/libbassflac/bassflac.txt"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
