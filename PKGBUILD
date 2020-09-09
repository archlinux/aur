# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass
pkgver=2.4.15
pkgrel=5
pkgdesc='BASS audio library'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib)
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::http://dl.un4seen.com/files/bass24-linux.zip")
source_armv6h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
source_armv7h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
source_aarch64=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums=('05200f84de1ba507e717f607640ccc3b5cef5860c002b61130b17941418d01fc')
sha256sums_armv6h=('18b5c30754b3ecaf6d3199aa98f424a703f38ee0d1ed5814422968aad41ec2c4')
sha256sums_armv7h=('18b5c30754b3ecaf6d3199aa98f424a703f38ee0d1ed5814422968aad41ec2c4')
sha256sums_aarch64=('18b5c30754b3ecaf6d3199aa98f424a703f38ee0d1ed5814422968aad41ec2c4')

prepare() {
  unzip -q "$pkgname-$pkgver.zip" -d "$srcdir/$pkgname-$pkgver"
  grep Lic "$pkgname-$pkgver/bass.txt" -A62 > LICENSE
  case "$CARCH" in
  armv6h|armv7h|aarch64)
    unzip -q "$pkgname-$pkgver-arm.zip" -d "$srcdir/$pkgname-$pkgver/arm"
    ;;
  esac
}

package() {
  cd "$pkgname-$pkgver"
  case "$CARCH" in
    i686)
      install -D -m644 libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    x86_64)
      install -D -m644 x64/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 arm/hardfp/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
    aarch64)
      install -D -m644 arm/aarch64/libbass.so "$pkgdir/usr/lib/libbass.so"
	  ;;
  esac
  install -D -m644 bass.h "$pkgdir/usr/include/bass.h"
  install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
  install -D -m644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
