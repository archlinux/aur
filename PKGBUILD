# Maintainer: Aaron Liu
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>
pkgname=libtorch-cpu
pkgver="2.10.0"
pkgrel=1
pkgdesc="PyTorch but C++ as an isolated folder"
arch=('x86_64')
url='https://docs.pytorch.org/cppdocs/installing.html'
license=('BSD-3-Clause')
depends=(pybind11)
makedepends=()
replaces=(libtorch-cxx11abi-cpu)
provides=("libtorch=${pkgver}")
conflicts=(libtorch)
source=("https://download.pytorch.org/libtorch/cpu/libtorch-shared-with-deps-${pkgver}%2Bcpu.zip"
	"https://github.com/pytorch/pytorch/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('c5bf8efda9224a2d971b19d1ef6cf3ba6fee8ab53e69c49427db003d1d300496'
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
