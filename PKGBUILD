# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-pyscipopt
pkgver=3.1.0
pkgrel=2
pkgdesc='A Python interface to the SCIP Optimization Suite.'
arch=('any')
url='https://www.scipopt.org/'
license=('MIT')
depends=('python' 'scipoptsuite')
makedepends=('cython' 'python-setuptools')
conflicts=('python-pyscipopt-git')
source=("https://github.com/SCIP-Interfaces/PySCIPOpt/archive/v${pkgver}.tar.gz")
md5sums=('9bf5f6b928888acb827298851804abc9')

build() {
	cd "${srcdir}/PySCIPOpt-${pkgver}"
	python setup.py build
}

check() {
	_arch="linux-$(uname -m)"
	_pymajver="$(python -V | sed 's/Python \([0-9]\+\.[0-9]\+\)\.[0-9]\+/\1/')"

	cd "${srcdir}/PySCIPOpt-${pkgver}/build/lib.${_arch}-${_pymajver}"
	python -Bc "import pyscipopt"
}

package() {
	cd "${srcdir}/PySCIPOpt-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
