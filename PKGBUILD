# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2019.1.1
_pkgver=${pkgver%.*}
pkgrel=3
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=(x86_64)
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'mesa')
license=("GPL")
url="http://www.flightgear.org/"
options=('makeflags' 'staticlibs')
source=("https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('201ed4cc841aa99e1c84acb3035a95fa36a77dd96c0dca290c46d21a290a548b')

prepare() {
  cd "$srcdir"/simgear-$pkgver
  sed -i -e "s|#include <simgear/structure/map.hxx>|#include <simgear/structure/map.hxx>\n#include <boost/utility/enable_if.hpp>|g" simgear/nasal/cppbind/NasalHash.hxx
}

build() {
  cd "$srcdir"/simgear-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTS=off ../simgear-${pkgver}
  make
}

package() {
  cd "$srcdir"/simgear-$pkgver
  make DESTDIR="$pkgdir" install
}
