# Maintainer: Olivier Sobrie <olivier at sobrie dot be>

pkgname='python-optlang'
pkgdesc="Python package implementing a modeling language for solving mathematical optimization problems."
pkgver=1.8.1
pkgrel=1
arch=('any')
url='https://optlang.readthedocs.io'
license=('Apache-2.0')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9eb586b69fd88d558a8a0a0eac33c3067c59b5de510fddc36c0aa874eb74bfec')

depends=('python-six>=1.9.0' 'python-sympy>=1.0.0' 'python-swiglpk>=1.4.3')
makedepends=('python-setuptools')
optdepends=(
	'cplex: for CPLEX support (LP, MILP, QP, MIQP)'
	'gurobi: for Gurobi support (LP, MILP, QP, MIQP)'
	'python-osqp: for OSPQ support (LP, QP)'
	'scip: for SCIP support (LP)'
)

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
