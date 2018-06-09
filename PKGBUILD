# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=lms7002m-driver-git
pkgver=r241.90cd852
pkgrel=1
pkgdesc="A portable driver for the LMS7002M dual transceiver"
arch=(any)
url="https://github.com/myriadrf/LMS7002M-driver"
license=('Apache')
makedepends=('git' 'cmake')
provides=('lms7002m-driver')
conflicts=('lms7002m-driver')
source=("git+$url")
md5sums=('SKIP')

_rname="LMS7002M-driver"

pkgver() {
  cd $srcdir/$_rname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p $srcdir/$_rname/build
  cd $srcdir/$_rname/build

  cmake .. \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $srcdir/$_rname/build

  make DESTDIR="$pkgdir" install
}
