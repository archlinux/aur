# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass
pkgver=2.4.16
pkgrel=5
pkgdesc='BASS audio library'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bass24-linux.zip")
source_armv6h=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
source_armv7h=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
source_aarch64=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
sha256sums=('77f387762a9ee4b72da3c6581c22e50456ab7aeb7c9a7154564530a9468db655')
sha256sums_armv6h=('7300ac8c112551bea6dc691b2ef3102fd208c07628c2cc822476465c077b20ba')
sha256sums_armv7h=('7300ac8c112551bea6dc691b2ef3102fd208c07628c2cc822476465c077b20ba')
sha256sums_aarch64=('7300ac8c112551bea6dc691b2ef3102fd208c07628c2cc822476465c077b20ba')

prepare() {
  grep Lic "$srcdir/bass.txt" -A62 > LICENSE
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    x86_64)
      install -D -m644 x64/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 hardfp/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    aarch64)
      install -D -m644 aarch64/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
  esac

  install -D -m644 bass.h "$pkgdir/usr/include/bass.h"
  install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
