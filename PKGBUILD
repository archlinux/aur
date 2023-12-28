# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-topojson"
_name=${pkgname#python-}
pkgdesc="Encode spatial data as topology in Python"
url="https://mattijn.github.io/topojson/"

pkgver=1.7
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

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("30fa7f88bb5660f70e4e02a2c9e7571753d56fc2369e29e72826e750b8f47a3c05142e7259bdc6e5d03b3ffb67e3bd83bb12bf863d24acd5edf94945fd8260c9")

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
