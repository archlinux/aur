# Maintainer: revel <revelΘmuub·net>

pkgname=cuda_memtest
pkgver=r83.dd723aa
pkgrel=2
pkgdesc="A GPU memory test utility for NVIDIA and AMD GPUs."
arch=('i686' 'x86_64')
url="https://github.com/ComputationalRadiationPhysics/cuda_memtest"
license=('Illinois Open Source License')
depends=(
    'cuda'
#    'opencl-icd-loader'
    )
optdepends=(
#        'opencl-nvidia: OpenCL implemention for NVIDIA'
#        'opencl-catalyst: AMD/ATI drivers. OpenCL implemention for AMD Catalyst'
#        'opencl-mesa: OpenCL support for AMD/ATI Radeon mesa drivers'
        )
makedepends=('cmake'
             'git'
#            'opencl-headers'
            )
source=("$pkgname"::'git+https://github.com/ComputationalRadiationPhysics/cuda_memtest.git'
        'path.patch')
sha256sums=('SKIP'
            '25b80161f63b61562015e8c89d1f4ff77b2d1d9140f879d7e29cf3ad7447cbca')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
#  patch -p1 -i ../path.patch
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" ..
  make
}

package() {
  cd "$pkgname"
  cd build
  make install
#  install -d "$pkgdir/usr/bin/"
#  install ocl_memtest "$pkgdir/usr/bin/"
#  install -d "$pkgdir/usr/share/$pkgname/"
#  install -m644 ocl_memtest_kernels.cpp "$pkgdir/usr/share/$pkgname/"
}
