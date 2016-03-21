# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=gr-dvbt
pkgname=$_pkgname-git
pkgver=r464.58165b9
pkgrel=1
pkgdesc="Opensource implementation of DVB-T encoder/decoder according to ETSI 300 744 using gnuradio"
arch=('i686' 'x86_64')
url="https://github.com/BogdanDIA/gr-dvbt"
license=('GPL')
depends=('gnuradio' 'python2')
makedepends=('git' 'cmake' 'boost')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+http://github.com/BogdanDIA/$_pkgname")
md5sums=('SKIP')
_gitname=$_pkgname

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export PYTHON=python2
  cd "$srcdir/$_gitname"
  msg "Starting build."
  mkdir -p build
  cd build
  cmake \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$_gitname/build/"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
