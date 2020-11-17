# Maintainer: Cameron Will <cwill747@gmail.com>
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: 0xfc <sfc_0@yahoo.com.cn>
# Modified from rtl-sdr-git PKGBUILD

pkgname=gr-osmosdr-git
pkgver=0.2.1.5.gfe03d83
pkgrel=1
pkgdesc="GNU Radio source block for OsmoSDR, which is a 100% Free Software based small form-factor inexpensive SDR (Software Defined Radio) project."
arch=('i686' 'x86_64')
url="https://osmocom.org/projects/gr-osmosdr/wiki"
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

source=('git+https://git.osmocom.org/gr-osmosdr')
md5sums=('SKIP')
_gitname="gr-osmosdr"

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
