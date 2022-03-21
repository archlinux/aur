# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-convertdate
_pkgname=${pkgname:7}
pkgver=2.4.0
pkgrel=1
pkgdesc="Converts between Gregorian dates and other calendar systems"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python python-nspektr)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('770c6b2195544d3e451e230b3f1c9b121ed02680b877f896306a04cf6f26b48f')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -ie '7s/>=60.5.0//' pyproject.toml
}
build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
