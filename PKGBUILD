# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=picos
pkgname="python-${_name}-git"
pkgver=2.5.r0.g2283909
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers (git version)'
arch=(any)
url='https://gitlab.com/picos-api/picos'
license=(GPL-3.0-or-later)
optdepends=(
    'cplex: solve using CPLEX'
    'gurobi: solve using Gurobi'
    'mosek: solve using MOSEK'
    'python-ecos: solve using ECOS'
    'python-pyscipopt: solve using SCIP'
    'python-smcp: solve using SMCP'
    'python-swiglpk: solve using GLPK'
    'python-osqp: solve using OSQP'
    'python-qics: solve using QICS'
)
makedepends=(git python-setuptools python-build python-installer python-wheel)
conflicts=(python-picos-git)
provides=(python-picos)
conflicts=(python-picos)
source=("git+https://gitlab.com/picos-api/picos.git")
md5sums=('SKIP')

pkgver() {
    cd "${_name}"
    ./version.py --aur
}

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
