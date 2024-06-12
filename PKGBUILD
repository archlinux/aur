# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=deadbeef-plugin-gui-qt5-git
pkgver=1.9.r143.gab2ea67
pkgrel=2
pkgdesc="Qt5 plugin for DeaDBeeF (latest commit)"
url="https://github.com/kuba160/ddb_gui_qt5"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('deadbeef' 'qt5-base' 'qt5-charts' 'qt5-declarative' 'qt6-declarative')
makedepends=('git' 'make')
provides=("deadbeef-gui-qt5-git" "ddb-gui-qt5-git"
          "deadbeef-plugin-gui-qt5" "deadbeef-gui-qt5" "ddb-gui-qt5")
conflicts=("deadbeef-plugin-gui-qt5")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ddb_gui_qt5
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.preview2//'
}

build() {
  cd ddb_gui_qt5
  qmake ddb_gui_qt5.pro
  make
}

package() {
  install -Dm755 ddb_gui_qt5/ddb_gui_qt5.so -t "$pkgdir/usr/lib/deadbeef"
}
