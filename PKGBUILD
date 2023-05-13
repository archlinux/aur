# Maintainer:
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libbass_mpc
pkgver=2.4.1.2
pkgrel=1
pkgdesc='BASS audio library Musepack plugin'
arch=(i686 x86_64 armv6h armv7h aarch64)
url='https://www.un4seen.com/'
license=(custom)
depends=(alsa-lib libbass)
source=("$pkgname-$pkgver.zip::http://www.un4seen.com/files/z/2/bass_mpc24-linux.zip")
sha256sums=('95957d167fac4badf675cdefed113279a273edab7798cb72dbe06dccf32d59a3')

prepare() {
  grep Dis "$srcdir/readme.txt" -A13 > LICENSE
}

package() {
  case "$CARCH" in
    i686)
      install -D -m644 libs/x86/libbass_mpc.so "$pkgdir/usr/lib/libbass_mpc.so"
	  ;;
    armv6h|armv7h)
      install -D -m644 libs/armhf/libbass_mpc.so "$pkgdir/usr/lib/libbass_mpc.so"
	  ;;
    aarch64|x86_64)
      install -D -m644 libs/$CARCH/libbass_mpc.so "$pkgdir/usr/lib/libbass_mpc.so"
	  ;;
  esac

  install -D -m644 c/bass_mpc.h "$pkgdir/usr/include/bass_mpc.h"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u=2 un4seen.com/bass.html
# vim: ts=2 sw=2 et:
