# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-components
_pkgname=wtforms-components
pkgver=0.10.3
pkgrel=1
pkgdesc='Additional fields, validators and widgets for WTForms'
arch=('any')
url="https://wtforms-components.readthedocs.io"
license=('BSD')
depends=('python-colour' 'python-dateutil' 'python-infinity' 'python-intervals' 'python-validators')
checkdepends=('python-pytest' 'python-wtforms-test')

source=("https://github.com/kvesteri/wtforms-components/archive/$pkgver.tar.gz")
sha256sums=('ba0b82a5055156ea75d926b197329574894f873d4166a30c81d99a7410ae3a08')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    pytest
}
