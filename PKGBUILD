# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-expat
pkgver=2.0.1
pkgrel=3
pkgdesc='XML Parser library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://expat.sourceforge.net/'
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc' 'devkitppc-portlibs-zlib')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/expat-$pkgver.tar.bz2")
sha256sums=('b4565d5ef6caa6c66e9fe2a06830ab904595771e6a8a84524ac65553ec3b2b8f')

build() {
  cd expat-$pkgver

  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2 -I$DEVKITPRO/portlibs/ppc/include -L$DEVKITPRO/portlibs/ppc/lib"

  ./configure --prefix="$DEVKITPRO/portlibs/ppc" --host=powerpc-eabi \
    --disable-shared --enable-static
  make buildlib # only build library, no programs
}

package() {
  cd expat-$pkgver

  make DESTDIR="$pkgdir" installlib # only install headers and library
}
