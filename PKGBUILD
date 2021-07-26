# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

_pkgname=midicomp
pkgname=$_pkgname-git
pkgver=r27.70f7696
pkgrel=1
pkgdesc="Convert SMF MIDI files to and from plain text"
arch=('x86_64')
url="https://github.com/markc/midicomp"
license=('AGPLv3')
makedepends=('git' 'cmake')
source=("$_pkgname::git+https://github.com/markc/$_pkgname.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "$srcdir/$_pkgname"
  cd build
  make
}

package() {
  cd "$srcdir/$_pkgname"
  cd build
  make DESTDIR="$pkgdir" install
}
