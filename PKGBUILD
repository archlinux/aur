# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-pyscipopt-git
pkgver=3.1.0.r3.gdc8e592
pkgrel=2
pkgdesc='A Python interface to the SCIP Optimization Suite. Git version.'
arch=('any')
url='https://www.scipopt.org/'
license=('MIT')
depends=('python' 'scipoptsuite')
makedepends=('git' 'cython' 'python-setuptools')
provides=('python-pyscipopt')
conflicts=('python-pyscipopt')
source=("${pkgname}::git+https://github.com/SCIP-Interfaces/PySCIPOpt.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

check() {
	_arch="linux-$(uname -m)"
	_pymajver="$(python -V | sed 's/Python \([0-9]\+\.[0-9]\+\)\.[0-9]\+/\1/')"

	cd "${srcdir}/${pkgname}/build/lib.${_arch}-${_pymajver}"
	python -Bc "import pyscipopt"
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
