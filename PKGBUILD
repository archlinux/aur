# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=wirerope
pkgname=python-wirerope
pkgver=0.4.3
pkgrel=1
pkgdesc="Wrapper interface for python callable"
url="https://pypi.python.org/pypi/wirerope/"
depends=('python' 'python-six')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/youknowone/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('d2584179b62a1c6861aaa5ff8985fbe18a59ae16951c7f1042f03b930f42c2a1')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHONPATH=./build/lib pytest --verbose --cov-config .coveragerc --cov wirerope
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
