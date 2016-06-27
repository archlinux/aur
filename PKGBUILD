# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=qlipper
pkgname=$_pkgname-git
pkgver=2.0.2.31.gdae06f3
pkgrel=1
pkgdesc='Cross-platform clipboard history applet'
arch=('i686' 'x86_64')
url='https://github.com/pvanek/qlipper'
license=('GPL2')
depends=('qt5-base' 'gtk-update-icon-cache')
makedepends=('cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/pvanek/qlipper.git')
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/./g"
}

build() {
  rm -Rf build && mkdir build && cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
