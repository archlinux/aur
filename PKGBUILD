# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=openthreads
pkgver=2.6.0
pkgrel=1
pkgdesc="A  minimal & complete Object-Oriented thread interface for C++ programmers"
arch=('x86_64')
url="http://openthreads.sourceforge.net"
license=("LGPL")
depends=('gcc-libs')
makedepends=('cmake' 'subversion')
source=(svn+http://svn.openscenegraph.org/osg/OpenThreads/tags/OpenThreads-$pkgver/)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/OpenThreads-$pkgver"
  sed -i 's#LIB_POSTFIX "64"#LIB_POSTFIX ""#' CMakeLists.txt
}

build() {
  cd "$srcdir/OpenThreads-$pkgver"
  cmake . -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DLIB_POSTFIX=
  make
}

package() {
  cd "$srcdir/OpenThreads-$pkgver"
  make DESTDIR="$pkgdir" install
}
