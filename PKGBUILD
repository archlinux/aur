# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-cartogram
_name=${pkgname#python-}
pkgdesc="A Python library to compute continuous cartograms"
url="https://python-cartogram.readthedocs.io/"

pkgver=1.0.0
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
b2sums=("f3af4c6bb00c7a63c079d2caa128e20ab9c0d8beacc23513dd502208cb58ec431fcc59cd17e41f5be14a5332d88eb4dde1e69e31a1edbcbc0fa9bd71979576cb")

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
