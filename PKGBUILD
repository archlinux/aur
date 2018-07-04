# Maintainer: ArsenArsen <arsenarsentmc@outlook.com>
pkgname=kshare
pkgver=v4.1.r11
pkgrel=2
conflicts=("kshare-git")
pkgdesc="The free and open source and cross platform screen sharing software."
arch=('i686' 'x86_64')
url="https://gitlab.com/ArsenArsen/KShare"
license=('MIT')
provides=('kshare=$pkgver')
depends=(qt5-base qt5-x11extras qt5-svg xcb-util-cursor ffmpeg libxfixes)
makedepends=(git pkg-config)
source=(git+https://gitlab.com/ArsenArsen/KShare.git KShare.desktop)
sha256sums=('SKIP' '55dccedd3183f2df903d812347c97bb02855fe7f4b774947ce737609847cf5b3')

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
  install -Dm644 ../KShare.desktop "$pkgdir/usr/share/applications/KShare.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

