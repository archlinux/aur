# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: rabyte <rabyte__gmail>

pkgname=vspcplay
pkgver=1.3
pkgrel=3
pkgdesc="A terminal-based visual SNES sound file (SPC) player and optimisation tool"
arch=('i686' 'x86_64')
url="http://vspcplay.raphnet.net/"
license=('GPL2')
depends=('sdl')
source=("http://vspcplay.raphnet.net/${pkgname}-${pkgver}.tar.gz")
md5sums=('9c80e3eab9c50868a10836b7f778c103')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's|\./||g' main.c utils/applymask32.c
  make CFLAGS="${CFLAGS} $(sdl-config --cflags)"
  cd utils
  # fix implicit function declaration warning
  sed -i '2 i\#include <string.h>' applymask32.c
  make CC="gcc ${CFLAGS}"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  install -m755 vspcplay utils/applymask32 ${pkgdir}/usr/bin/
  install -Dm644 vspcplay-icon.ico ${pkgdir}/usr/share/pixmaps/vspcplay.ico
}
