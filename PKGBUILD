# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare
pkgver=4.1r6
pkgrel=1
conflicts=("kshare-git")
pkgdesc="The free and open source and cross platform screen sharing software."
arch=('i686' 'x86_64')
url="https://github.com/ArsenArsen/KShare"
license=('MIT')
provides=('kshare=$pkgver')
depends=(qt5-base qt5-x11extras xcb-util-cursor ffmpeg libxfixes)
source=(git+https://github.com/ArsenArsen/KShare.git)
sha1sums=('SKIP')

build() {
  cd "${srcdir}/KShare"
  git submodule update --init --recursive  
  qmake
  make
}

package() {
  cd "${srcdir}/KShare"
  mkdir -p "$pkgdir/usr/bin"
  install ./KShare "$pkgdir/usr/bin/kshare"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install "${srcdir}/KShare/icons/icon.png" "$pkgdir/usr/share/pixmaps/KShare.png"
  mkdir -p "$pkgdir/usr/share/applications"
#  install KShare.desktop "$pkgdir/usr/share/applications"
}

