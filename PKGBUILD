# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=4.3.1
pkgrel=1
pkgdesc='Task graph framework for heterogeneous CPU-GPU systems.'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('hsa-rocr' 'comgr')
makedepends=('cmake' 'rsync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/atmi/archive/rocm-$pkgver.tar.gz")
sha256sums=('4497fa6d33547b946e2a51619f2777ec36e9cff1b07fd534eb8a5ef0d8e30650')
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
