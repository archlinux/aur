# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=stormchecker-git
pkgver=1.3.0.r380.g28f8c9d82
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
# TODO: carl-git hides some dependencies here
depends=(glpk hwloc xerces-c z3 carl-master14-git)
makedepends=(git cmake)
source=("stormchecker-git::git+https://github.com/moves-rwth/storm.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  rm -rf build/
  
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
	..

  make binaries
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install
}
