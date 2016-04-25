# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=nomacs
pkgname=$_pkgname-git
pkgver=3.0.0.233.gc4e8903
pkgrel=1
pkgdesc="Free, open source image viewer, which supports multiple platforms."
arch=("i686" "x86_64")
url="http://nomacs.org"
license=("GPL3")
depends=("qt5-svg" "exiv2" "libraw" "opencv" "desktop-file-utils")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+https://github.com/$_pkgname/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname/ImageLounge" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
