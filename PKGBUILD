# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos-git
pkgver=2.2.r0.g8015e45
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers. Git version.'
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
makedepends=('git' 'python-setuptools')
provides=('python-picos')
conflicts=('python-picos')
source=("git+https://gitlab.com/picos-api/picos.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/picos"
	./version.py --aur
}

build() {
	cd "${srcdir}/picos"
	python setup.py build
}

check() {
	cd "${srcdir}/picos/build/lib"
	python -Bc "import picos"
}

package() {
	cd "${srcdir}/picos"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
