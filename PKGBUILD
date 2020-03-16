# Maintainer: Steven Huang <s@stvhuang.me>
pkgname=libtorch
pkgver=1.4.0
pkgrel=2
pkgdesc="PyTorch C++ API"
arch=('x86_64')
url="https://pytorch.org/cppdocs/"
license=('BSD')
depends=()
optdepends=(
    "cuda: NVIDIA's GPU programming toolkit"
    'cudnn: NVIDIA CUDA Deep Neural Network library'
)
options=(!strip)
source=(
    "https://download.pytorch.org/libtorch/cu101/libtorch-cxx11-abi-shared-with-deps-${pkgver}.zip"
)
sha256sums=(
    'f214bfde532877aa5d4e0803e51a28fa8edd97b6a44b6615f75a70352b6b542e'
)

prepare () {
    # https://github.com/pytorch/pytorch/issues/15476
    sed -i -e 's/\/usr\/local\/cuda/\/opt\/cuda/g' ${srcdir}/libtorch/share/cmake/Caffe2/Caffe2Targets.cmake
}

package() {
    mkdir -p ${pkgdir}/usr
    cp -dr ${srcdir}/libtorch/* ${pkgdir}/usr
}
