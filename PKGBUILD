# Maintainer: Steven Huang <s@stvhuang.me>
pkgname=libtorch
pkgver=1.5.0
pkgrel=1
pkgdesc="PyTorch C++ API"
arch=('x86_64')
url="https://pytorch.org/cppdocs/"
license=('BSD')
depends=()
optdepends=(
    "cuda: NVIDIA's GPU programming toolkit"
    'cudnn: NVIDIA CUDA Deep Neural Network library'
)
makedepends=('sed')
options=(!strip)
source=(
    "https://download.pytorch.org/libtorch/cu102/libtorch-cxx11-abi-shared-with-deps-${pkgver}.zip"
)
sha256sums=(
    '0efdd4e709ab11088fa75f0501c19b0e294404231442bab1d1fb953924feb6b5'
)

prepare () {
    # https://github.com/pytorch/pytorch/issues/15476
    sed -i -e 's/\/usr\/local\/cuda/\/opt\/cuda/g' ${srcdir}/libtorch/share/cmake/Caffe2/Caffe2Targets.cmake
}

package() {
    install -Ddm755 ${pkgdir}/usr
    cp -dr --no-preserve=ownership ${srcdir}/libtorch/* ${pkgdir}/usr/
}
