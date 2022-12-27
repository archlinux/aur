# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-fuse
pkgver=0.0.63
pkgrel=1
pkgdesc="A tool to run build commands in a sandbox with CAS as storage backend"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(fuse3 google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-fuse#tag=0.0.63&commit=be4bc3d3bfd7d6a1426f6a42ac9e91d46c344e94")
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
