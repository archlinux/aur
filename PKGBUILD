# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glog-git
pkgver=0.3.4.r141.g2a6df66
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

  aclocal
  autoconf
  automake -a

  ./configure
  make
}

check() {
  cd "glog"

  #make check
}

package() {
  cd "glog"

  make prefix="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/glog/COPYING"
}

