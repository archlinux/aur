# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=picos
pkgname="python-${_name}"
pkgver=2.5
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers'
arch=(any)
url='https://gitlab.com/picos-api/picos'
license=(GPL-3.0-or-later)
depends=(python-numpy python-cvxopt)
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
makedepends=(python-setuptools python-build python-installer python-wheel)
conflicts=(python-picos-git)
source=("https://gitlab.com/picos-api/picos/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha256sums=('1c3082bcd19f1fd0a4686de0144ec94c10fd3aa5340fe004ce211f2810f3392d')

build() {
    cd "${_name}-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-v${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
