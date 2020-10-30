# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=3.9.0
pkgrel=1
pkgdesc='Task graph framework for heterogeneous CPU-GPU systems.'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('hsa-rocr' 'comgr')
makedepends=('cmake' 'rsync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/atmi/archive/rocm-$pkgver.tar.gz")
sha256sums=('0a305e85bab210dd9a0410aa01d46227e00b59141e4675c50d731ad1232ab828')
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
