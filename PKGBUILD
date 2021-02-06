# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-pyscipopt-git
pkgver=3.1.0.r3.gdc8e592
pkgrel=3
pkgdesc='A Python interface to the SCIP Optimization Suite. Git version.'
arch=('any')
url='https://www.scipopt.org/'
license=('MIT')
depends=('python' 'scipoptsuite')
makedepends=('git' 'cython' 'python-setuptools')
provides=('python-pyscipopt')
conflicts=('python-pyscipopt')
source=("git+https://github.com/SCIP-Interfaces/PySCIPOpt.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/PySCIPOpt"
	python setup.py build
}

check() {
	_arch="linux-$(uname -m)"
	_pymajver="$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')"

	cd "${srcdir}/PySCIPOpt/build/lib.${_arch}-${_pymajver}"
	python -Bc "import pyscipopt"
}

package() {
	cd "${srcdir}/PySCIPOpt"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
