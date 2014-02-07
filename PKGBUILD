# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-libpng
pkgver=1.5.4
pkgrel=2
pkgdesc='PNG format graphic files library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://www.libpng.org'
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc' 'devkitppc-portlibs-zlib')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libpng-$pkgver.tar.bz2")
sha256sums=('9743d1a84e84b756e19707b09ca5874d7052c5dc65d6cc1a1e231998833f5529')

build() {
  cd libpng-$pkgver

  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2 -I$DEVKITPRO/portlibs/ppc/include -L$DEVKITPRO/portlibs/ppc/lib"

  ./configure --prefix="$DEVKITPRO/portlibs/ppc" --host=powerpc-eabi \
    --disable-shared --enable-static
  make
}

package() {
  cd libpng-$pkgver

  make DESTDIR="$pkgdir" install
  # remove useless stuff
  rm -r "$pkgdir"/opt/devkitpro/portlibs/ppc/share
}
