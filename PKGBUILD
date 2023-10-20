# Maintainer: Markus Koch <markus@notsyncing.net>

pkgname=python-cocotb-test-git
pkgver=r280.ae949ce
pkgrel=1
pkgdesc="cocotb-test provides standard python unit testing capabilities for cocotb"
arch=('any')
url="https://github.com/themperek/cocotb-test"
license=('BSD2')
depends=('python' 'python-setuptools' 'python-cocotb' 'python-pytest')
provides=('python-cocotb-test')
conflicts=('python-cocotb-test')
makedepends=('git')
optdepends=('iverilog: for simulating verilog designs'
            'ghdl: for simulating VHDL designs'
            'gtkwave: for visualizing waveforms'
            'python-pytest-xdist: for parallel runs')

options=(!emptydirs)
source=("git+https://github.com/themperek/cocotb-test")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/cocotb-test"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/cocotb-test"
    python setup.py build
}

package() {
    cd "${srcdir}/cocotb-test"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
