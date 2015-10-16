# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Modified from gr-osmosdr-git PKGBUILD

pkgname=gr-cc1111-git
pkgver=6b5eb0
pkgrel=1
pkgdesc="CC1111 packet encoder/decoder for GNU Radio"
arch=('i686' 'x86_64')
url="https://github.com/funoverip/gr-cc1111"
license=('GPL3')
depends=(
    'gnuradio'
    'swig'
    )
makedepends=(
    'git'
    'cmake'
    'boost'
    )
source=('git+https://github.com/funoverip/gr-cc1111.git')
md5sums=('SKIP')

_gitname="gr-cc1111"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g; s|^.||'
}

build() {
  cd $_gitname
  mkdir -p build
  cd build
  cmake -DPYTHON_EXECUTABLE=$(which python2) -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) -DCMAKE_INSTALL_PREFIX=/usr ../src/gr-cc1111
  make
}

package() {
  cd $_gitname/build
  make DESTDIR=${pkgdir} install
}
