# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-geohexgrid
_name=${pkgname#python-}
pkgdesc="A Python library for making geographic flat-top hexagon grids"
url="https://github.com/mrcagney/geohexgrid"

pkgver=2.1.1
pkgrel=1

arch=("any")
license=("MIT")

depends=(
    "python"
    "python-geopandas"
    "python-rtree"
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
b2sums=("330956d93e528fc933cd17680b48f3655112d102aff3bc2fed81f32f4180c326f0caa9396125f032734580a78e70643eedf5be24d7fe642bfe05a2f7fd1886f4")

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
