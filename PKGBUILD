# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=deadbeef-plugin-gui-qt6-git
pkgver=1.9.r196.6e3c309
pkgrel=1
pkgdesc="Qt6 plugin for DeaDBeeF (Qt 6 branch) (latest commit)"
url="https://github.com/kuba160/ddb_gui_qt5"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('deadbeef' 'qt6-charts' 'qt6-declarative' 'qt6-svg')
makedepends=('cmake' 'git')
provides=("deadbeef-gui-qt6-git" "ddb-gui-qt6-git"
          "deadbeef-plugin-gui-qt6" "deadbeef-gui-qt6" "ddb-gui-qt6")
conflicts=("deadbeef-plugin-gui-qt6" "deadbeef-plugin-gui-qt5")
source=("ddb_gui_qt6::git+$url.git#branch=q")
sha256sums=('SKIP')

pkgver() {
  cd ddb_gui_qt6
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.preview2//' | sed 's/\.\(g\)/\./'
}

build() {
  cd ddb_gui_qt6
  cmake -B build
  cmake --build build
}

package() {
  install -Dm755 ddb_gui_qt6/build/ddb_gui_qt5.so -t "$pkgdir/usr/lib/deadbeef"
}
