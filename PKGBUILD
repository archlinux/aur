# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos
pkgver=2.3
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
	'python-osqp: solve using OSQP'
)
makedepends=('python-setuptools')
conflicts=('python-picos-git')
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/picos-v${pkgver}.tar.gz")
md5sums=('47f598bf471091dd51ef6ee3f4466a57')

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
