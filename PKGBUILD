# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipcub
pkgver=3.3.0
pkgrel=2
pkgdesc='Header-only library on top of rocPRIM or CUB'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#hipcub'
license=('custom')
depends=('rocprim')
optdepends=('cuda: CUB backend')
makedepends=('cmake' 'git' 'hcc')
source=("$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('0d97cada3b856e8c62affbb3664ac4fc2415a36ad3d9b9d7155b5f954e492392')

build() {
  mkdir -p build
  cd build

  CXX=/opt/rocm/hcc/bin/hcc \
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/hipcub \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        "$srcdir/hipCUB-rocm-$pkgver"
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/hipCUB-rocm-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
