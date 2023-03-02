# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-common
pkgver=0.0.65
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('gflags' 'google-glog' 'grpc' 'gtest')
makedepends=('benchmark' 'c-ares' 'cmake' 'git' 'gmock'  ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#tag=0.0.65&commit=f3af583653331281a11ffa2f956f04b459e0b868")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../buildbox-common \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Sometimes 'streamingstandardoutputinotifyfilemonitor' fails, just rerun it."
  ninja -k-1 test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
