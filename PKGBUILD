# Maintainer: Christos Tsirigotis <tsirif \at/ gmail \dot/ com>
# Date: 2017-01-17
pkgname=nccl-git
_pkgname='nccl'
pkgver=1.3.0.1.r13.2a974f5
pkgrel=1
pkgdesc="NVIDIA CUDA optimized primitives for collective multi-GPU communication"
arch=('i686' 'x86_64')
url="https://github.com/NVIDIA/nccl.git"
license=('BSD')
depends=('cuda>=7.0')
makedepends=('git' 'make')
optdepends=('openmpi: To use `ncclCommInitRank` in multi-process applications')
provides=('nccl')
conflicts=('nccl')
source=("git+https://github.com/NVIDIA/nccl.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^.//')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CUDA_HOME=/opt/cuda all
}

package() {
  cd "${srcdir}/${_pkgname}"
  make CUDA_HOME=/opt/cuda PREFIX=${pkgdir}/opt/cuda install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
