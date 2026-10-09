# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pingouin
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc='Statistical package for Python'
arch=(any)
url=https://pingouin-stats.org/build/html/index.html
license=(GPL3)
depends=(
    python
    python-numpy
    python-scipy
    python-pandas
    python-matplotlib
    python-seaborn
    python-statsmodels
    python-scikit-learn
    python-pandas-flavor
    python-tabulate
    python-mpmath
)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('19d180d2fe9663ec91908f3bf6c81cef32564f55c34aa186ad5b2cd9cad33ee3')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    PYTHONPATH=src pytest \
	--deselect tests/test_pairwise.py::TestPairwise::test_pairwise_tests \
	--deselect tests/test_power.py::TestPower::test_power_ttest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
