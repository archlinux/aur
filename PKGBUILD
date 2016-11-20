# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-freetype2
pkgver=2.4.2
pkgrel=3
pkgdesc='TrueType font rendering library (for Nintendo Gamecube/Wii/Wii U homebrew development)'
arch=('any')
url='http://freetype.sourceforge.net'
license=('GPL')
options=(!strip libtool staticlibs)
depends=('devkitppc' 'devkitppc-portlibs-zlib')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/freetype-$pkgver.tar.bz2")
sha256sums=('9a987aef8c50d9bcfdfdc9f012f8bd0de6095cc1a5524e62c1a037deb8dacbfe')

build() {
  cd freetype-$pkgver

  # set environment
  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2 -ffunction-sections -fdata-sections \
    -I$DEVKITPRO/portlibs/ppc/include -L$DEVKITPRO/portlibs/ppc/lib"

  ./configure --prefix="$DEVKITPRO/portlibs/ppc" --host=powerpc-eabi \
    --disable-shared --enable-static
  make
}

package() {
  make -C freetype-$pkgver DESTDIR="$pkgdir" install
}
