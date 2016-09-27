# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='pavucontrol-qt'
pkgname="$_pkgname-git"
pkgver=0.1.0.2.g384c329
pkgrel=1
pkgdesc='Qt port of pavucontrol'
arch=('i686' 'x86_64')
url='https://github.com/lxde/pavucontrol-qt'
license=('GPL2')
depends=('libpulse' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools' 'liblxqt-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/pavucontrol-qt.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/./g"
}

build() {
  rm -Rf build ; mkdir build ; cd build
  cmake $srcdir/$_pkgname \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
