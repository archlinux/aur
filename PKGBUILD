# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pingouin
_name=${pkgname#python-}
pkgver=0.6.0
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
sha256sums=('f9a522ab1c13c72dcf74e4e040e1896a328aa06eeebf9c8b0276ea24dbf53c33')


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
