# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-components
_name=wtforms_components
pkgver=0.11.0
pkgrel=1
pkgdesc='Additional fields, validators and widgets for WTForms'
arch=('any')
url="https://wtforms-components.readthedocs.io"
license=('BSD-3-Clause')
makedepends=(python-build python-wheel python-installer)
depends=(python-anyjson python-colour python-intervals 'python-validators>=0.21' python-wtforms)
checkdepends=(python-pytest python-wtforms-test python-email-validator)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('ca94d60a6362c0e4b49d3d09d1eb1ddf5b26c99105a57397af313655f4447f7a')

build() {
    cd "${_name}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer dist/*.whl --dest="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${_name}-${pkgver}"
    pytest
}
