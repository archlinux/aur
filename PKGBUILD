# Maintainer: Schrottfresse <schrottfresse@gmx.de>
pkgname=libspatialindex-git
pkgver=r581.8956c14
pkgrel=1
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
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}
