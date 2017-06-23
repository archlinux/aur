# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare-git
pkgver=cdb5e82cca89e552b163c5e94c59d1437c75e4ca0
pkgrel=1
pkgdesc="A ShareX inspired cross platform utility written with Qt."
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
}

pkgver() {
  cd "${srcdir}/KShare"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

