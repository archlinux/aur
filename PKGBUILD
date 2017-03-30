# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glog-git
pkgver=0.3.4.r88.gda816ea
pkgrel=2
pkgdesc="C++ implementation of the Google logging module"
arch=('i686' 'x86_64')
url="https://github.com/google/glog"
license=('BSD')
makedepends=('git')
provides=('glog')
conflicts=('glog')
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

