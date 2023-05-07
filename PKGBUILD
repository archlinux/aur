# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-fuse
pkgver=0.0.66
pkgrel=0
pkgdesc="A tool to run build commands in a sandbox with CAS as storage backend"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(fuse3 google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-fuse#tag=0.0.66&commit=96e62a4129dad75e0173e3bec8176792f6f1b040")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../buildbox-fuse \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
