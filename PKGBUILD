# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

_pkgname=libtorch
pkgbase=libtorch-cxx11abi
pkgname=(
    libtorch-cxx11abi-cuda
    libtorch-cxx11abi-rocm
    libtorch-cxx11abi-cpu
)

pkgver="2.2.2"
_cuda_version="cu121"
_rocm_version="rocm5.7"
pkgrel=1
_pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CXX11 ABI)"
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=()
makedepends=()
source=(
    "${_pkgname}-cuda.zip::https://download.pytorch.org/libtorch/cu121/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2B${_cuda_version}.zip"
    "${_pkgname}-rocm.zip::https://download.pytorch.org/libtorch/rocm5.7/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2B${_rocm_version}.zip"
    "${_pkgname}-cpu.zip::https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2Bcpu.zip"
)
noextract=(
    "${_pkgname}-cuda.zip"
    "${_pkgname}-rocm.zip"
    "${_pkgname}-cpu.zip"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)
options=('!strip' '!debug' 'libtool' 'staticlibs')

package_libtorch-cxx11abi-cuda() {
    pkgdesc="${_pkgdesc} (with CUDA support)"
    provides=("libtorch-cxx11abi-cuda")
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-cuda.zip"
    mv ${_pkgname} ${_pkgname}-cuda
}

package_libtorch-cxx11abi-rocm() {
    pkgdesc="${_pkgdesc} (with ROCM support)"
    provides=("libtorch-cxx11abi-rocm")
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-rocm.zip"
    mv ${_pkgname} ${_pkgname}-rocm
}

package_libtorch-cxx11abi-cpu() {
    pkgdesc="${_pkgdesc} (CPU only)"
    provides=("libtorch-cxx11abi-cpu")
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-cpu.zip"
    mv ${_pkgname} ${_pkgname}-cpu
}
