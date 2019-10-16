# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glog-git
pkgver=0.4.0.r6.g4cc89c9
pkgrel=1
pkgdesc="C++ implementation of the Google logging module"
arch=('i686' 'x86_64')
url="https://github.com/google/glog"
license=('BSD')
makedepends=('git')
provides=('google-glog')
conflicts=('google-glog')
options=('staticlibs')
source=('git+https://github.com/google/glog.git')
sha256sums=('SKIP')


pkgver() {
  cd "glog"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "glog"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "glog"

  #make check
}

package() {
  cd "glog"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/glog"
}

