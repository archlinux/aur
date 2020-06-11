# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=3.5.0
pkgrel=1
pkgdesc="Asynchronous Task and Memory Interface (ATMI) is a task graph framework for heterogeneous CPU-GPU systems."
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('rocm-cmake' 'rocm-device-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/atmi/archive/rocm-$pkgver.tar.gz")
sha256sums=('3fb57d2e583fab82bd0582d0c2bccff059ca91122c18ac49a7770a8bb041a37b')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/atmi \
        "$srcdir/atmi-rocm-$pkgver/src"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
