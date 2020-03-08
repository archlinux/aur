# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=cocotb-git
pkgver=r2445.e9490fab
pkgrel=1
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="https://github.com/cocotb/cocotb"
license=('BSD')
conflicts=(cocotb)
provides=('cocotb')
depends=('python')

makedepends=('git' 'python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs')

options=(!emptydirs)
source=('git+https://github.com/cocotb/cocotb')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/cocotb"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/cocotb"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}