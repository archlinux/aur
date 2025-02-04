# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

_pkgname=libtorch
pkgbase=libtorch-cxx11abi
pkgname=(
    libtorch-cxx11abi-cuda
    libtorch-cxx11abi-rocm
    libtorch-cxx11abi-cpu
)

pkgver="2.6.0"
_cuda_version="cu126"
_rocm_version="rocm6.2.4"
pkgrel=1
_pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CXX11 ABI)"
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=(pybind11)
makedepends=()
source=()
sha256sums=()
options=('!strip' '!debug' 'libtool' 'staticlibs')

package_libtorch-cxx11abi-cuda() {
    pkgdesc="${_pkgdesc} (with CUDA support)"
    provides=("libtorch-cxx11abi-cuda")
    depends=(pybind11)
    cd ${srcdir}
    wget https://download.pytorch.org/libtorch/${_cuda_version}/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2B${_cuda_version}.zip -O ${_pkgname}-${pkgver}-cuda.zip
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-${pkgver}-cuda.zip"
    rm -rf ${_pkgname}/include/pybind11
    mv ${_pkgname} ${_pkgname}-cuda
}

package_libtorch-cxx11abi-rocm() {
    pkgdesc="${_pkgdesc} (with ROCM support)"
    provides=("libtorch-cxx11abi-rocm")
    depends=(pybind11)
    cd ${srcdir}
    wget https://download.pytorch.org/libtorch/${_rocm_version}/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2B${_rocm_version}.zip -O ${_pkgname}-${pkgver}-rocm.zip
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-${pkgver}-rocm.zip"
    rm -rf ${_pkgname}/include/pybind11
    mv ${_pkgname} ${_pkgname}-rocm
}

package_libtorch-cxx11abi-cpu() {
    pkgdesc="${_pkgdesc} (CPU only)"
    provides=("libtorch-cxx11abi-cpu")
    depends=(pybind11)
    cd ${srcdir}
    wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2Bcpu.zip -O ${_pkgname}-${pkgver}-cpu.zip
    install -vdm755 "${pkgdir}/opt"
    cd ${pkgdir}/opt
    bsdtar -xv -f "${srcdir}/${_pkgname}-${pkgver}-cpu.zip"
    rm -rf ${_pkgname}/include/pybind11
    mv ${_pkgname} ${_pkgname}-cpu
}
