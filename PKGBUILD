# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos
pkgver=2.2
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
depends=('python-numpy' 'python-cvxopt')
optdepends=(
	'cplex: solve using CPLEX'
	'gurobi: solve using Gurobi'
	'mosek: solve using MOSEK'
	'python-ecos: solve using ECOS'
	'python-pyscipopt: solve using SCIP'
	'python-smcp: solve using SMCP'
	'python-swiglpk: solve using GLPK'
)
makedepends=('python-setuptools')
conflicts=('python-picos-git')
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/picos-v${pkgver}.tar.gz")
md5sums=('745f4df0bc84ed4773f9a891bc6cb9f1')

build() {
	cd "${srcdir}/picos-v${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/picos-v${pkgver}/build/lib"
	python -Bc "import picos"
}

package() {
	cd "${srcdir}/picos-v${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
