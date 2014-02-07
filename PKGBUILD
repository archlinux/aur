# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-zlib
pkgver=1.2.5
pkgrel=2
pkgdesc='Deflate compression method library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://www.zlib.net/'
license=('zlib')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/zlib-$pkgver.tar.bz2")
sha256sums=('36f3341a85779a5a43f1bd216bbd95e1e7783abff4ac55ad2819598d4ca6dd7c')

build() {
  cd zlib-$pkgver

  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2"

  CHOST=powerpc-eabi ./configure --prefix="$DEVKITPRO/portlibs/ppc" --static
  make libz.a # only build library, no programs
}

package() {
  cd zlib-$pkgver

  make DESTDIR="$pkgdir" install
  # remove useless stuff
  rm -r "$pkgdir"/opt/devkitpro/portlibs/ppc/share
}
