# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=stormchecker
pkgver=1.1.0
pkgrel=1
pkgdesc="Storm is a tool for the analysis of systems involving random or probabilistic phenomena"
arch=(i686 x86_64)
url="http://www.stormchecker.org/"
license=('GPL3')
groups=()
conflicts=('stormchecker')
provides=('stormchecker')
# TODO: mathsat?
# TODO: sylvan is always shipped at the moment
# TODO: carl hides some dependencies here
depends=(glpk hwloc xerces-c z3 carl)
makedepends=(cmake)
source=("https://github.com/moves-rwth/storm/archive/$pkgver.tar.gz")
md5sums=('b85a8162197abca05e76c0cb9475ce1f')

build() {
  cd "storm-$pkgver"
  rm -rf build/
  
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
	..

  make binaries
  make storm-pgcl-cli
}

package() {
  cd "storm-$pkgver"/build
  make DESTDIR="$pkgdir/" install/fast
}
