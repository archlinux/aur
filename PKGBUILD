# Maintainer: fenugrec <fenugrec at users sourceforge org>
# based on vspcplay PKGBUILD by rabyte / Boohbah

_pkgbase=vspcplay
pkgname=vspcplay-git
pkgver=1.3
pkgrel=3
pkgdesc="A terminal-based visual SNES sound file (SPC) player and optimisation tool"
arch=('i686' 'x86_64')
url="http://vspcplay.raphnet.net/"
license=('GPL2')
depends=('sdl')
source=(git+https://github.com/raphnet/vspcplay)
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgbase}
  make CFLAGS="${CFLAGS} $(sdl-config --cflags)"
  cd utils
  make CC="gcc ${CFLAGS}"
}

package() {
  cd ${srcdir}/${_pkgbase}
  mkdir -p ${pkgdir}/usr/bin
  install -m755 vspcplay utils/applymask32 ${pkgdir}/usr/bin/
  install -Dm644 vspcplay-icon.ico ${pkgdir}/usr/share/pixmaps/vspcplay.ico
}
