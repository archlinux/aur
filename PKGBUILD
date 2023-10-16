# Maintainer: Markus Koch <markus@notsyncing.net>

pkgname=python-cocotb-git
pkgver=r3638.13a4c949
pkgrel=1
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="https://github.com/cocotb/cocotb"
license=('BSD')
conflicts=('python-cocotb')
provides=('python-cocotb')
depends=('python' 'python-setuptools' 'python-find_libpython')
makedepends=('git')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=('git+https://github.com/cocotb/cocotb')
md5sums=('SKIP')

build() {
    cd "${srcdir}/cocotb"
    python setup.py build
}

package() {
    cd "${srcdir}/cocotb"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "${srcdir}/cocotb"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
