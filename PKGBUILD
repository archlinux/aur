# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>

pkgname=devkitppc-portlibs-tremor-lowmem
pkgver=20100725
pkgrel=2
pkgdesc='Integer-only Ogg Vorbis decoder library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://www.xiph.org/vorbis/'
license=('BSD')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/tremor-lowmem-src.tar.bz2")
sha256sums=('54a40ce5521f908b91b44bc9259ea499b8b7299b37b154c348614373ed79840c')

build() {
  cd tremor-lowmem

  source /etc/profile.d/devkitppc.sh
  CFLAGS="-g -O2" ./autogen.sh --prefix="$DEVKITPRO/portlibs/ppc" \
    --host=powerpc-eabi --disable-shared --enable-static
  make
}

package() {
  cd tremor-lowmem

  make DESTDIR="$pkgdir" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
