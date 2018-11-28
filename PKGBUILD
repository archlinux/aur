# Maintainer: Schrottfresse <schrottfresse@gmx.de>
pkgname=libspatialindex-git
pkgver=r500.e4a15b6
pkgrel=2
pkgdesc="C++ implementation of R*-tree, an MVR-tree and a TPR-tree with C API "
arch=('i686' 'x86_64')
url="http://libspatialindex.github.com/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'gtest')
provides=('libspatialindex')
conflicts=('libspatialindex')
source=('git+https://github.com/libspatialindex/libspatialindex.git')
md5sums=('SKIP')

_gitname=libspatialindex

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_gitname
  sed -i -e 's+#!/usr/bin/env python$+#!/usr/bin/env python2+' ./test/gtest/gtest-*/scripts/*.py

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
