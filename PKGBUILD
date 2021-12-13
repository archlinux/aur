# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
#_name=${pkgname#python-}
_name="GeoAlchemy2"
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.8.4
pkgrel=3

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-shapely"
    "python-sqlalchemy"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("d9336f17df3e7a10f94d1ea2488dcfb97a8bc23fe7f5edea425ddab553534b0a")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 COPYING.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
