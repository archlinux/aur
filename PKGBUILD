# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass
pkgver=2.4.16
pkgrel=4
pkgdesc='BASS audio library'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/bass24-linux.zip")
source_armv6h=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
source_armv7h=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
source_aarch64=("$pkgname-$pkgver-arm.zip::http://www.un4seen.com/files/bass24-linux-arm.zip")
sha256sums=('08820155d3941fa0c6e8a9ad8bfe1d92e0419dc384cb3086d6ac487d5152ab80')
sha256sums_armv6h=('ddf3593d064ac67bb7c836db35a6cc693b2ec37b98f86d90af0c8f27f533f26e')
sha256sums_armv7h=('ddf3593d064ac67bb7c836db35a6cc693b2ec37b98f86d90af0c8f27f533f26e')
sha256sums_aarch64=('ddf3593d064ac67bb7c836db35a6cc693b2ec37b98f86d90af0c8f27f533f26e')

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
