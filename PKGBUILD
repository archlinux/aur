# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-topojson"
_name=${pkgname#python-}
pkgdesc="Encode spatial data as topology in Python"
url="https://mattijn.github.io/topojson/"

pkgver=1.10
pkgrel=1

arch=("any")
license=("BSD-3-Clause")

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
    "python-fiona"
    "python-geojson"
    "python-geopandas"
    "python-ipywidgets"
    "python-pyshp"
    "python-pytest"
    "python-simplification"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mattijn/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("594f420eafcdb2dc9632f362c39e75d3a126868858896db856d9aa7cfc056682ff56a4e54d808dd32dfa712e88c47315049de45ab71ab51cc55f8b9e3f59f287")

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
