# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-bandwidth-test
pkgver=5.2.1
pkgrel=1
pkgdesc="Bandwidth test for ROCm"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_bandwidth_test"
license=('custom:NCSAOSL')
depends=('hsa-rocr')
makedepends=('cmake')
options=(!staticlibs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_bandwidth_test/archive/rocm-$pkgver.tar.gz")
sha256sums=('ebdf868bef8ab6c7f32775ba6eab85cf3e078af1fc1b1a11fdbaad777f37a190')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake -Wno-dev -B build \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
}
