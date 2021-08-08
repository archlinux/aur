# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=4.3.0
pkgrel=1
pkgdesc='Task graph framework for heterogeneous CPU-GPU systems.'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('hsa-rocr' 'comgr')
makedepends=('cmake' 'rsync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/atmi/archive/rocm-$pkgver.tar.gz")
sha256sums=('1cbe0e9258ce7cce7b7ccc288335dffbac821ceb745c4f3fd48e2a258abada89')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/atmi \
        -DROCM_VERSION="$pkgver" \
        "$_dirname/src"
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
