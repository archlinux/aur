# Maintainer: Stefan Damm <autama at nurfuerspam dot de>

pkgname=qtmidi-qt5
pkgver=git
pkgrel=2
pkgdesc="A midi plugin for Qt."
arch=('i686' 'x86_64')
url="https://gitlab.com/tp3/qtmidi"
license=('GPL3')
depends=(alsa-lib qt5-base)

provides=(libQt5Midi)
source=(git+https://gitlab.com/tp3/qtmidi.git)
md5sums=('SKIP') #not a stable md5 for head

build() {
  cd "qtmidi"

  mkdir -p build
  cd build
  qmake-qt5 ..
  make
}

package() {
  cd "qtmidi"

  cd "build"

  mkdir -p "$pkgdir/usr/lib/qt/plugins"
  mkdir -p "$pkgdir/usr/include"

  make INSTALL_ROOT="$pkgdir" install
}
