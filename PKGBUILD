# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-iio-git
_gitname=gr-iio
pkgver=20170705 
pkgrel=1
pkgdesc="IIO blocks for GNU Radio"
url="https://github.com/analogdevicesinc/gr-iio"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libad9361-iio-git')
makedepends=('git' 'cmake' 'boost' 'swig')
source=("git+https://github.com/analogdevicesinc/gr-iio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  export PYTHON=python2
  # AD9361_INCLUDE_DIRS ?
  # AD9361_LIBRARIES ?
  cmake \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
