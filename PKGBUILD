# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-geohexgrid
_name=${pkgname#python-}
pkgdesc="A Python library for making geographic flat-top hexagon grids"
url="https://github.com/mrcagney/geohexgrid"

pkgver=3.0.0
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
b2sums=("d79f1740b0c11e025c5eeb3a7c7cbe01334cb7db1f39fc1cc795eccca6522d503e1d67106a9ed91cd16c811cba71f7c9f64239aff6134b49049fbab583bb32e8")

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
