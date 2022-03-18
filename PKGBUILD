# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.2.0.53
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://pypi.org/project/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('04d9f4dbc2fd9f38a491e533a076867c86fbfc5d7999116ce32852054e1d44db')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}/third_party/3/pandas/_libs
    rm index.pyi missing.pyi properties.pyi sparse.pyi
    cd tslibs
    rm nattype.pyi np_datetime.pyi parsing.pyi period.pyi timedeltas.pyi timestamps.pyi timezones.pyi tzconversion.pyi
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
