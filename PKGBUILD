# Maintainer: Aaron Liu
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>
pkgname=libtorch-rocm
pkgver="2.10.0"
pkgrel=1
pkgdesc="PyTorch but C++ as an isolated folder, with ROCm included"
arch=('x86_64')
url='https://docs.pytorch.org/cppdocs/installing.html'
license=('BSD-3-Clause')
depends=(pybind11)
makedepends=()
replaces=(libtorch-cxx11abi-rocm)
provides=("libtorch=${pkgver}")
conflicts=(libtorch)
source=("https://download.pytorch.org/libtorch/rocm7.1/libtorch-shared-with-deps-${pkgver}%2Brocm7.1.zip"
	"https://github.com/pytorch/pytorch/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('605532aeea2e22b639c2c4c239d2994f040457adff1a22cfb4c6d12b4b9641f7'
            'bd018feef8825e88181c84eb7e3aa4eafb8f08a20d9fd6ef948569610c4a3e43')
options=('!debug')

prepare() {
	rm -r libtorch/include/pybind11
}

package() {
    install -dm755 "${pkgdir}/opt"
    mv libtorch "${pkgdir}/opt/libtorch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libtorch/LICENSE"
}
