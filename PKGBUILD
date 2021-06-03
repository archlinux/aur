# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-cocotb-bus-git
pkgver=r3101.a3e22f78
pkgrel=1
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="https://github.com/cocotb/cocotb-bus"
license=('BSD')
conflicts=('python-cocotb-bus')
provides=('python-cocotb-bus')
depends=('python')
makedepends=('git' 'python-setuptools-scm')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=('git+https://github.com/cocotb/cocotb-bus')
md5sums=('SKIP')

build() {
    cd "${srcdir}/cocotb-bus"
    python setup.py build
}

package() {
    cd "${srcdir}/cocotb-bus"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "${srcdir}/cocotb-bus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}