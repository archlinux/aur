# Maintainer:  Michael     (https://aur.archlinux.org/account/michael_wzq)

pkgname=psi4
pkgver=1.10
pkgrel=1
pkgdesc="Open-Source Quantum Chemistry - an electronic structure package in C++ driven by Python"
arch=("x86_64")
url="http://psicode.org"
license=("GPL")
depends=(blas lapack python python-numpy gau2grid eigen
		 pybind11 python-qcelemental python-qcengine libxc
		 python-optking python-msgpack python-networkx)
makedepends=(gcc cmake make)
checkdepends=()
optdepends=(perl python-pytest python-pytest-xdist python-sphinx python-nbsphinx)
provides=(psi4)
conflicts=(psi4-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/psi4/psi4/archive/v${pkgver}.tar.gz)
sha256sums=('2d0ffcec6ff61141fbf13e8ee7ba984e28fc268659f67833352303a6356cc4e4')

build() {
    cd $pkgname-$pkgver
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
	cd build
	make -j`getconf _NPROCESSORS_ONLN`
}

check() {
	cd "$pkgname-$pkgver/build"
	ctest -L quick
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
}
