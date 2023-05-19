# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
#_name=${pkgname#python-}
_name="GeoAlchemy2"
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.13.3
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools-scm"
    "python-wheel"
)
depends=(
    "python"
    "python-shapely"
    "python-sqlalchemy"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('2b005639efab15e283b4cf40d2e2949c53ed18ab30f5c77fa80ac8c7fa091566a7255ace768847dc9a67715014b3929c8b1be1d56cb160d89ee2db3811428196')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 COPYING.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
