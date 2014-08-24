# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-mxml
pkgver=2.6
pkgrel=3
pkgdesc='Small XML parser library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://www.minixml.org/'
license=('LGPL')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/mxml-$pkgver-src.tar.bz2")
sha256sums=('780d4bc7c3b5ab207412487402cc56dff670521da8a57315ca0047c2d4667ad5')

build() {
  cd mxml-$pkgver

  source /etc/profile.d/devkitppc.sh
  CFLAGS="-g -O2" ./configure --prefix="$DEVKITPRO/portlibs/ppc" \
    --host=powerpc-eabi --disable-shared --enable-static
  make
}

package() {
  cd mxml-$pkgver

  make DSTROOT="$pkgdir" install
  # remove useless stuff
  rm -r "$pkgdir"/opt/devkitpro/portlibs/ppc/{share,bin}
}
