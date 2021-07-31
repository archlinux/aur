# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass
pkgver=2.4.16
pkgrel=2
pkgdesc='BASS audio library'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib)
source=("$pkgname-$pkgver.zip::http://dl.un4seen.com/files/bass24-linux.zip")
source_armv6h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
source_armv7h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
source_aarch64=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums=('d8119f20bef8bc7916a0766158c3ced5173e0a05216151be81e1088c884b730b')
sha256sums_armv6h=('e3b0193e98163ea1b7f127777bcd091fbf800af7043b80e6b266a7d23a8048a9')
sha256sums_armv7h=('e3b0193e98163ea1b7f127777bcd091fbf800af7043b80e6b266a7d23a8048a9')
sha256sums_aarch64=('e3b0193e98163ea1b7f127777bcd091fbf800af7043b80e6b266a7d23a8048a9')

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
