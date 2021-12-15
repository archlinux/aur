# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-components
_pkgname=wtforms-components
pkgver=0.10.5
pkgrel=1
pkgdesc='Additional fields, validators and widgets for WTForms'
arch=('any')
url="https://wtforms-components.readthedocs.io"
license=('BSD')
depends=('python-colour' 'python-dateutil' 'python-infinity' 'python-intervals' 'python-validators')
checkdepends=('python-pytest' 'python-wtforms-test' 'python-email-validator')

source=("$pkgname-$pkgver.tar.gz::https://github.com/kvesteri/wtforms-components/archive/$pkgver.tar.gz")
sha256sums=('aa8bec34effc28db0e4a187499f56f85c5bd5b3969342451da84ebc2a3d7c3cd')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    pytest
}
