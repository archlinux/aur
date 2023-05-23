# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-topojson"
_name=${pkgname#python-}
pkgdesc="Encode spatial data as topology in Python"
url="https://mattijn.github.io/topojson/"

pkgver=1.5
pkgrel=2

arch=("any")
license=("BSD")

makedepends=(
    "python-build"
    "python-flit"
    "python-installer"
    "python-wheel"
)
depends=(
    "python"
    "python-numpy"
    "python-shapely"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("3f1f61b5b10e615a48c0acb4dbc340a4050ecf47f3aa26a2826b68a65d68d8c6dd59f0485a8d539a133eaf7afabba7399bd3fa2fe79c5844c8cd51eb690baeb9")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
