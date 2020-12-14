# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>

pkgname=fceux-git
pkgver=2.2.3.1633.gf333a62d
pkgrel=1
pkgdesc="Fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support"
arch=('i686' 'x86_64')
url="http://fceux.com/"
license=('GPL')
depends=('sdl' 'lua51' 'gtk2' 'gd' 'libgl')
makedepends=('git' 'cmake' 'libgl' 'glu')
optdepends=('xchm: for viewing the help manual')
provides=('fceux')
conflicts=('fceux')
source=(git://github.com/TASVideos/fceux.git)
md5sums=('SKIP')

pkgver() {
  cd fceux
  git describe --always| sed 's/-/./g' | sed 's/fceux.//'
}


build() {
  cd fceux
  mkdir -p build
  cd build
  cmake ../
  make
}

package() {
  cd fceux

  install -D -m755 build/src/fceux "$pkgdir/usr/bin/fceux"
  install -D -m644 output/fceux.chm "$pkgdir/usr/share/doc/fceux/fceux.chm"
  install -D -m644 "fceux.desktop" "$pkgdir/usr/share/applications/fceux.desktop"
  install -D -m644 "fceux.png" "$pkgdir/usr/share/pixmaps/fceux.png"
}
