# Maintainer: Nickolay Mardanov <soniczerops@gmail.com>

pkgname=repraptor-git
pkgver=20150520
pkgrel=1
pkgdesc="A Qt RepRap gcode sender/host controller"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/NeoTheFox/RepRaptor"
provides=('repraptor')
conflicts=('repraptor')
depends=('qt5-base' 'qt5-serialport' 'libxkbcommon-x11')
makedepends=('git' 'gcc')
source=('git+https://github.com/NeoTheFox/RepRaptor.git')
md5sums=('SKIP')

_gitname="RepRaptor"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  qmake-qt5 PREFIX="/usr" VERSION="$pkgver -config release"
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir"  install
}

