# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-alchemy
_pkgname=wtforms-alchemy
pkgver=0.19.1
pkgrel=1
pkgdesc='Tools for creating wtforms from sqlalchemy models'
arch=('any')
url="https://wtforms-alchemy.readthedocs.io"
license=('BSD-3-Clause')
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-phonenumbers python-sqlalchemy python-sqlalchemy-utils python-wtforms python-wtforms-components) 
checkdepends=(python-pytest python-sqlalchemy-i18n python-wtforms-test)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kvesteri/wtforms-alchemy/archive/$pkgver.tar.gz")
sha256sums=('25ff2078f8b1528fca2f0faf765bae2770a37673f5f2f63b96c6eda5be8b6bb4')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer dist/*.whl --dest="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest tests
}
