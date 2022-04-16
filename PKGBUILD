# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='juffed'
pkgname="$_pkgname-git"
pkgver=0.10.118.g73ad560
pkgrel=1
pkgdesc='Advanced text editor written in Qt'
arch=('i686' 'x86_64')
url=https://juffed.com
license=('GPL')
depends=('qt5-base' 'qscintilla-qt5' 'qtermwidget' 'enca')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-qt5-git")
source=("git+https://github.com/mezomish/juffed.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/^juffed.//;s/-/./g'
}

build() {
  rm -Rf build && mkdir -p build
  cd build
  cmake ../$_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib \
        -DUSE_ENCA=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
