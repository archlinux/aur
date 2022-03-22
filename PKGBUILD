# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pyportfolioopt
_pkgname=PyPortfolioOpt
pkgver=1.5.1
pkgrel=1
pkgdesc="Financial portfolio optimization in python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
depends=(
    python
    python-cvxopt
    python-cvxpy
    python-matplotlib
    python-numpy
    python-pandas
    python-scikit-learn
    python-scipy
    python-yfinance
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('49af6f4f3fcf850b4a9808251802d8f26299b32877694d97981da8b5bd344d98')

prepare() {
    # https://github.com/robertmartin8/PyPortfolioOpt/issues/425
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -ie '2s/PyPortfolioOpt/pyportfolioopt/' pyproject.toml
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
