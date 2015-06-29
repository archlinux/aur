# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-gsm-git
_gitname=gr-gsm
pkgver=20150627 
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving GSM transmissions"
url="https://github.com/ptrkrysik/gr-gsm"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gnuradio-osmosdr' 'python2-scipy')
makedepends=('git' 'cmake' 'boost' 'swig')
source=("git+https://github.com/ptrkrysik/gr-gsm.git")
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
