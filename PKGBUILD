# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-freetype2
pkgver=2.4.2
pkgrel=2
pkgdesc='TrueType font rendering library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://freetype.sourceforge.net'
license=('GPL')
options=(!strip libtool staticlibs)
depends=('devkitppc' 'devkitppc-portlibs-zlib')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/freetype-$pkgver.tar.bz2")
sha256sums=('9a987aef8c50d9bcfdfdc9f012f8bd0de6095cc1a5524e62c1a037deb8dacbfe')

build() {
  cd freetype-$pkgver

  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2 -I$DEVKITPRO/portlibs/ppc/include -L$DEVKITPRO/portlibs/ppc/lib"

  ./configure --prefix="$DEVKITPRO/portlibs/ppc" --host=powerpc-eabi \
    --disable-shared --enable-static
  make
}

package() {
  cd freetype-$pkgver

  make DESTDIR="$pkgdir" install
}
