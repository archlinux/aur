# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare
pkgver=v4.1.r8
pkgrel=1
conflicts=("kshare-git")
pkgdesc="The free and open source and cross platform screen sharing software."
arch=('i686' 'x86_64')
url="https://github.com/ArsenArsen/KShare"
license=('MIT')
provides=('kshare=$pkgver')
depends=(qt5-base qt5-x11extras qt5-svg xcb-util-cursor ffmpeg libxfixes)
makedepends=(git pkg-config)
source=(git+https://github.com/ArsenArsen/KShare.git)
sha1sums=('SKIP')

prepare() {
  cd KShare
  git submodule update --init --recursive
}

build() {
  cd KShare
  qmake
  make
}

package() {
  cd KShare
  install -Dm755 src/kshare "$pkgdir/usr/bin/kshare"
  install -Dm644 src/icons/icon.png "$pkgdir/usr/share/pixmaps/KShare.png"
  install -Dm644 KShare.desktop "$pkgdir/usr/share/applications/KShare.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

