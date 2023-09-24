# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-fuse
pkgver=1.0.2
pkgrel=2
pkgdesc="A tool to run build commands in a sandbox with CAS as storage backend"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(fuse3 google-glog grpc util-linux-libs 'buildbox-common')
makedepends=(benchmark 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-fuse#tag=1.0.2&commit=90b80e4ed48e624059b9922dc4018b43dc7f3e7e")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  CXXFLAGS="-flto=auto -O2 -ffunction-sections -Wl,--gc-sections" cmake ../buildbox-fuse \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
