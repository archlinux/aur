# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname="juffed"
pkgname="$_pkgname-git"
pkgver=0.10.71.gc3c1a3f
pkgrel=1
pkgdesc="Advanced text editor written in Qt"
arch=("i686" "x86_64")
url="http://juffed.com"
license=("GPL")
depends=("qt4" "qscintilla" "enca" "desktop-file-utils")
makedepends=("git" "cmake")
provides=("$_pkgname" "$_pkgname-git" "$_pkgname-qt5-git")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-qt5-git")
install=juffed-git.install
source=("git+https://github.com/Mezomish/juffed.git")
sha256sums=("SKIP")

pkgver() {

  mkdir -p build

  cd "$_pkgname"
  git describe --always | sed 's/^juffed.//;s/-/./g'

}

build() {

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
