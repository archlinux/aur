# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-geohexgrid
_name=${pkgname#python-}
pkgdesc="A Python library for making geographic flat-top hexagon grids"
url="https://github.com/mrcagney/geohexgrid"

pkgver=2.1.2
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
b2sums=("de945d3873b6c7095023fb774e5986b213ca9973a302ca23eb5ab03e65144d8bf829e9a1221997bb21621589fb97e5e98191806f2b37392ad00f543fdf5fddc4")

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
