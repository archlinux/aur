# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt-git
pkgver=r498.f2ad8aa
pkgrel=2
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/cmdrkotori/mpc-qt'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git')
provides=('mpc-qt')
conflicts=('mpc-qt')
source=("git+${url}.git"
        'mpc-qt.desktop')
sha256sums=('SKIP'
            '7694745aac0e52c050a6bc069a0686b025e509136919d985d3c4495eec0f1c9d')

pkgver() {
  cd mpc-qt
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mpc-qt
  qmake-qt5 mpc-qt.pro
  make
}

package() {
  cd mpc-qt
  install -Dm755 mpc-qt "$pkgdir/usr/bin/mpc-qt"
  install -Dm644 ../mpc-qt.desktop "$pkgdir/usr/share/applications/mpc-qt.desktop"
  install -Dm644 images/bitmaps/icon.png "$pkgdir/usr/share/pixmaps/mpc-qt.png"
}
