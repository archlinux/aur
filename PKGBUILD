# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos-git
pkgver=2.1.r2.gf31ae78
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
conflicts=('python-picos')
source=("picos::git+https://gitlab.com/picos-api/picos.git")
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
	python -BIc "import picos"
}

package() {
	cd "${srcdir}/picos"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
