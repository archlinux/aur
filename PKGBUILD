# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitppc-portlibs-libjpeg
pkgver=8d
pkgrel=1
pkgdesc='JPEG format graphic files library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://www.ijg.org/'
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/jpeg-$pkgver.tar.bz2")
sha256sums=('8315375a8bace8b903a9f22aa10e398572efabd35eb1c12d74c1515d32f1fba9')

build() {
  cd jpeg-$pkgver

  source /etc/profile.d/devkitppc.sh
  CFLAGS="-g -O2" ./configure --prefix="$DEVKITPRO/portlibs/ppc" \
    --host=powerpc-eabi --disable-shared --enable-static
  make libjpeg.la # only build library, no programs
}

package() {
  cd jpeg-$pkgver

  DESTDIR="$pkgdir" make install-data-local install-includeHEADERS \
    install-libLTLIBRARIES # only install headers and library
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 174 README | tail -n 77 > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
