# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pingouin
_name=${pkgname#python-}
pkgver=0.5.5
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
)
optdepends=('python-mpmath: for computing one-sided Bayes factor of Pearson correlation')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2aac834128e99a4df8cffd8151c21adc7c42fe493e389c6fc2581b84e436ddd9')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
