# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=5.3.0
pkgrel=1
pkgdesc='Task graph framework for heterogeneous CPU-GPU systems.'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('hsa-rocr' 'comgr')
makedepends=('cmake' 'rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('dffc0eb0bc1617843e7f728dbd6c8b12326c5c8baa34369aa267aab40f5deb6a')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname/src" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/atmi \
    -DROCM_VERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
