# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.41.r0.gcbf52bb
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('c-ares' 'grpc' 'gtest' 'gmock' 'gflags' 'google-glog')
makedepends=('cmake' 'git')
_commit=cbf52bb5e2a5e515cd95fb165fc4848bd4b5d925 # release 0.0.41
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
