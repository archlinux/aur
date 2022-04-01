# Maintainer: Stanisław Grams <sjg@fmdx.pl>

pkgname=gr-sdrplay3-git
_pkgname=gr-sdrplay3
pkgver=1
pkgrel=1
pkgdesc=' Out-of-tree GNU Radio module for SDRplay RSP devices - SDRplay API V3.X'
url='https://github.com/fventuri/gr-sdrplay3'
arch=('x86_64')
license=('GPL')
depends=('gnuradio' 'libsdrplay')
makedepends=('git' 'cmake' 'boost' 'swig' 'pybind11')
replaces=('gr-sdrplay3')
source=("git+https://github.com/fventuri/gr-sdrplay3/#branch=maint-3.9")
md5sums=('SKIP')

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname
  mkdir -p build && cd build
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE="$(which python3)" \
    -DPYTHON_INCLUDE_DIR="$(echo /usr/include/python3*)" \
    -DPYTHON_LIBRARY="$(echo /usr/lib/libpython3.*.so)" \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
