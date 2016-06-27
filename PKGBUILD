# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='juffed'
pkgname="$_pkgname-git"
pkgver=0.10.85.g5ba17f9
pkgrel=1
pkgdesc='Advanced text editor written in Qt'
arch=('i686' 'x86_64')
url='http://juffed.com'
license=('GPL')
depends=('qt4' 'qscintilla' 'enca')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-qt5-git")
source=("git+https://github.com/Mezomish/juffed.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's/^juffed.//;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../$_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib \
        -DUSE_ENCA=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
