# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-components
_pkgname=wtforms-components
pkgver=0.10.5
pkgrel=2
pkgdesc='Additional fields, validators and widgets for WTForms'
arch=('any')
url="https://wtforms-components.readthedocs.io"
license=('BSD')
depends=('python-colour' 'python-dateutil' 'python-infinity' 'python-intervals' 'python-validators>=0.21')
checkdepends=('python-pytest' 'python-wtforms-test' 'python-email-validator')

source=("git+https://github.com/kvesteri/wtforms-components.git#tag=da7c3d46cff95"
    "fix_tests.patch")
sha256sums=('f71568414b65c99bdaea1f447e8befafad64bd13d2503bfce7d9b2d019df4dff'
            'e44e04969b4eb4c648b8c24bf01da3189b7e1b9730cfb0f2cd2ab9dea71f7302')

prepare() {
    cd "${_pkgname}"
    patch -p1 < ../fix_tests.patch
}

build() {
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "${_pkgname}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${_pkgname}"
    pytest
}
