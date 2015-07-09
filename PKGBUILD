# Maintainer: 0xfc <sfc_0@yahoo.com.cn>
# Modified from rtl-sdr-git PKGBUILD
pkgname=gr-osmosdr-git
pkgver=0.1.4.45.g46e9539
pkgrel=1
pkgdesc="GNU Radio source block for OsmoSDR, which is a 100% Free Software based small form-factor inexpensive SDR (Software Defined Radio) project."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/"
license=('GPL')
depends=('gnuradio' 'swig' 'rtl-sdr' 'libuhd')
makedepends=('git' 'cmake' 'boost' 'python2-cheetah')
provides=('gr-osmosdr')

source=('git://git.osmocom.org/gr-osmosdr')
md5sums=('SKIP')

#_gitroot="git://git.osmocom.org/gr-osmosdr"
_gitname="gr-osmosdr"

pkgver() {
  #date +%Y%m%d
  
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g; s|^.||'
  #echo "0"
}

build() {
  #cd "$srcdir"
  #msg "Connecting to GIT server...."

  #if [[ -d "$_gitname" ]]; then
  #  cd "$_gitname" && git pull origin
  #  msg "The local files are updated."
  #else
  #  git clone "$_gitroot" "$_gitname"
  #fi

  #msg "GIT checkout done or server timeout"
  #msg "Starting build..."

  #rm -rf "$srcdir/$_gitname-build"
  #git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  #cd "$srcdir/$_gitname-build/"
  
  cd "$srcdir/$_gitname"
  mkdir build
  cd build
#  cmake ../
  cmake -DPYTHON_EXECUTABLE=$(which python2) -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  #cd "$srcdir/$_gitname-build/build/"
  cd "$srcdir/$_gitname/build/"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
