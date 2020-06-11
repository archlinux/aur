# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-bandwidth-test
pkgver=3.5.0
pkgrel=1
pkgdesc="Bandwidth test for ROCm"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_bandwidth_test"
license=('custom:NCSAOSL')
depends=('hsa-rocr')
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_bandwidth_test/archive/rocm-$pkgver.tar.gz")
sha256sums=('fbb63fb8713617fd167d9c1501acbd92a6b189ee8e1a8aed668fa6666baae389')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocm_bandwidth_test \
        "$srcdir/rocm_bandwidth_test-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in rocm-bandwidth-test; do
    ln -s "/opt/rocm/rocm_bandwidth_test/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
