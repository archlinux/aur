# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-edalize-git
pkgver=r138.36c4b0c
pkgrel=1
pkgdesc="Python Library for interacting with EDA tools."
arch=('any')
url="https://github.com/olofk/edalize"
license=('BSD')
conflicts=('python-edalize')
provides=('python-edalize-git')
depends=('python' 'python-pytest')

makedepends=('git' 'python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=('git+https://github.com/olofk/edalize')
sha256sums=('SKIP')

package() {
    cd "${srcdir}/edalize"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "${srcdir}/edalize"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}