# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=wirerope
pkgname=python-wirerope
pkgver=0.4.5
pkgrel=1
pkgdesc="Wrapper interface for python callable"
url="https://pypi.python.org/pypi/wirerope/"
depends=('python' 'python-six')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/youknowone/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('c80cf84390f7916b3018dde2030ac0df59fa9558a147e8ef90fa102518f35117')

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
