# Maintainer: David Runge <dave@sleepmap.de>

pkgname=jackcpp-git
_basename=jackcpp
pkgver=r23.488554c
pkgrel=4
pkgdesc="Some c++ classes which wrap the Jack audio io api and lock-free ring buffer."
arch=('any')
url="http://github.com/x37v/jackcpp"
depends=('jack' 'swig' 'doxygen')
makedepends=('git')
sha256sums=('SKIP')
license=('GPL3')
source=("$_basename::git://github.com/x37v/jackcpp.git")

pkgver() {
  cd $_basename
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd $_basename
  make
  cd "$srcdir/${_basename}/doc"
  doxygen
}

package() {
  cd $_basename
  mkdir -p ${pkgdir}/usr/{include,lib,share/doc/${_basename}/{html,latex}}
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -Dm 644 $srcdir/${_basename}/src/* ${pkgdir}/usr/lib
  install -Dm 644 $srcdir/${_basename}/doc/html/* ${pkgdir}/usr/share/doc/${_basename}/html
  install -Dm 644 $srcdir/${_basename}/doc/latex/* ${pkgdir}/usr/share/doc/${_basename}/latex
}

