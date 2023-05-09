# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
#_name=${pkgname#python-}
_name="GeoAlchemy2"
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.13.2
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
b2sums=("b6855037c3818649426c36d15f8d71cadd8a0b476ac2c54b75b398d01234c2cf809d7bb4de53989adcb3be2cc03f1b697a5f6bd54f775b6b13da8bbcc8e1454e")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 COPYING.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
