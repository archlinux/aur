# Maintainer: mox <de ünderscöre mox )ä] zoho döt com>
# Contributor: mox <de ünderscöre mox )ä] zoho döt com>
pkgname=uvm-python-git
pkgver=r1174.26acd2b
pkgrel=1
pkgdesc="Port of SystemVerilog Universal Verification Methodology (UVM) 1.2 to Python and cocotb"
arch=('any')
url="https://github.com/tpoikela/uvm-python"
license=('APACHE')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('python' 'python-setuptools' 'python-cocotb')

makedepends=('git' 'python-wheel')
optdepends=('iverilog: for simulating verilog designs'
		'verilator: for simulating verilog designs'
		'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=('git+https://github.com/tpoikela/uvm-python')
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
