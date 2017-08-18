# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare-git
pkgver=v4.1.139.gfe86bfe
pkgrel=1
pkgdesc="The free and open source and cross platform screen sharing software."
arch=('i686' 'x86_64')
url="https://github.com/ArsenArsen/KShare"
license=('MIT')
provides=(kshare)
conflicts=(kshare)
depends=(qt5-base qt5-x11extras xcb-util-cursor ffmpeg libxfixes)
source=(git+https://github.com/ArsenArsen/KShare.git#branch=dev)
sha1sums=('SKIP')

pkgver() {
  cd KShare
  echo "$(git describe --long --tags | tr - .)"
}

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
  install -Dm755 KShare "$pkgdir/usr/bin/kshare"
  install -Dm644 icons/icon.png "$pkgdir/usr/share/pixmaps/KShare.png"
  install -Dm644 KShare.desktop "$pkgdir/usr/share/applications/KShare.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

