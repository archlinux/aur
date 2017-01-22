# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=libfm-qt
pkgname=$_pkgname-git
pkgver=0.11.1.8.g4556a9b
pkgrel=2
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=('i686' 'x86_64')
url='https://github.com/lxde/libfm-qt'
license=('LGPL')
depends=('qt5-x11extras' 'libfm')
makedepends=('git' 'cmake' 'qt5-tools' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname" 'pcmanfm-qt<=0.10.0')
source=('git+https://github.com/lxde/libfm-qt.git')
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

build() {
  mkdir -p build ; cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
