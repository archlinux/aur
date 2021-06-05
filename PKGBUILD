# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.46.r0.g66fd3e2
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('c-ares' 'grpc' 'gtest' 'gmock' 'gflags' 'google-glog' 'benchmark')
makedepends=('cmake' 'git')
_commit=66fd3e2ddca23b673c464c25a79ef877b44ec349 # release 0.0.46
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname             \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
