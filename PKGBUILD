# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-geohexgrid
_name=${pkgname#python-}
pkgdesc="A Python library for making geographic flat-top hexagon grids"
url="https://codeberg.org/araichev/geohexgrid"

pkgver=3.0.3
pkgrel=1

arch=("any")
license=("MIT")

depends=(
    "python"
    "python-geopandas"
)
makedepends=(
    "python-build"
    "python-hatchling"
    "python-installer"
    "python-setuptools"
    "python-uv"
    "python-wheel"
)
checkdepends=(
    "python-numpy"
    "python-pytest"
    "python-shapely"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("8dfa8a07f467e67cfa9071c6ea4f577bf1ed5a31b89a87af5907f73b1253d8f38f8faede064781061a81189699c6d7b1c8c69051b2e4af08b3aa8bd61cc7e7f2")

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
