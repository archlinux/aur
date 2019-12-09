# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>

pkgname=fceux-gtk3-git
pkgver=749567a
pkgrel=1
pkgdesc="Fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support"
arch=('i686' 'x86_64')
url="http://fceux.com/"
license=('GPL')
depends=('sdl' 'lua52' 'gtk3' 'gd' 'libgl')
makedepends=('git' 'scons' 'libgl' 'glu')
optdepends=('xchm: for viewing the help manual')
provides=('fceux')
conflicts=('fceux')
source=(git://github.com/TASVideos/fceux.git)
md5sums=('SKIP')

pkgver() {
  cd fceux
  git describe --always| sed 's/-/./g'
}


build() {
  cd fceux

  scons RELEASE=1 GTK3=1 GTK=0
}

package() {
  cd fceux

  install -D -m755 bin/fceux "$pkgdir/usr/bin/fceux"
  install -D -m755 bin/fceux-net-server "$pkgdir/usr/bin/fceux-net-server"
  install -D -m644 bin/fceux.chm "$pkgdir/usr/share/doc/fceux/fceux.chm"
  install -D -m644 "fceux.desktop" "$pkgdir/usr/share/applications/fceux.desktop"
  install -D -m644 "fceux.png" "$pkgdir/usr/share/pixmaps/fceux.png"
}
