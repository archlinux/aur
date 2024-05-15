# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-topojson"
_name=${pkgname#python-}
pkgdesc="Encode spatial data as topology in Python"
url="https://mattijn.github.io/topojson/"

pkgver=1.9
pkgrel=1

arch=("any")
license=("BSD")

depends=(
    "python"
    "python-numpy"
    "python-packaging"
    "python-shapely"
)
makedepends=(
    "python-build"
    "python-flit"
    "python-installer"
    "python-wheel"
)
checkdepends=(
    "python-altair"
    "python-geojson"
    "python-geopandas"
    "python-ipywidgets"
    "python-pyshp"
    "python-pytest"
    "python-simplification"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mattijn/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("b33dc37a51b6de26b25819e8f889eb1e0f74f586798e26e1fe8dcf59e16ff866a76eeea6aba74ab1d1840ba7881c1a9d004a7eb6b99c1ca79a54c6f253ee052c")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest .
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
