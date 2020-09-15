# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.19.r0.g735d4b3
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('grpc' 'gtest' 'gmock')
makedepends=('cmake' 'git')
_commit=735d4b33a5fdb38524913a3a74add395beff44dd # release 0.0.19
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
