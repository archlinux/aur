# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-cartogram
_name=${pkgname#python-}
pkgdesc="A Python library to compute continuous cartograms"
url="https://python-cartogram.readthedocs.io/"

pkgver=1.0.2
pkgrel=1

arch=("any")
license=("GPL-3.0-or-later")

depends=(
    "python"
    "python-geopandas"
    "python-joblib"
    "python-numpy"
    "python-pandas"
    "python-shapely"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
    "python-pytest-asyncio"
    "python-pytest-cov"
    "python-pytest-lazy-fixtures"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("065c30ac4ff6ac893da47e5add166d98a981a590cfe0b1031f34a25c9092511c5b256c18998a9f4402f4b60564277e7bf601f990bda889b83fe5ac57f0eda435")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
