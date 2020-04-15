# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: 0xfc <sfc_0@yahoo.com.cn>
# Modified from rtl-sdr-git PKGBUILD

pkgname=gr-osmosdr-git
pkgver=d77577
pkgrel=1
pkgdesc="GNU Radio source block for OsmoSDR, which is a 100% Free Software based small form-factor inexpensive SDR (Software Defined Radio) project."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/"
license=('GPL')
depends=(
    'gnuradio'
    'swig'
    'rtl-sdr'
    'libuhd'
    'libmirisdr-git'
    'libosmosdr-git'
    'airspy-git'
    )
makedepends=(
    'git'
    'cmake'
    'boost'
    'python-cheetah3'
    )
#optdepends=()
provides=('gr-osmosdr' 'gnuradio-osmosdr')

source=('git+https://github.com/drmpeg/gr-osmosdr39.git')
md5sums=('SKIP')
_gitname="gr-osmosdr39"

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g; s|^.||'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$_gitname/build/"
  make DESTDIR=${pkgdir} install
}
