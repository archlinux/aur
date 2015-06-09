#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=libsoxr-git
pkgver=0.1.1.r4.g988f830
pkgrel=1
pkgdesc="SoX Resampler library"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=('cmake' 'git')
provides=('libsoxr')
conflicts=('libsoxr')
url="http://sourceforge.net/projects/soxr/"
source=("$pkgname::git://git.code.sf.net/p/soxr/code")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  #rm -f CMakeCache.txt
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_TESTS=ON .
  make
}

check() {
  cd $pkgname

  make test
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
