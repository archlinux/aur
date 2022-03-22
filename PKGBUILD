# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-cityhash'
pkgver='0.4.0'
pkgrel=1
pkgdesc="Python bindings for CityHash"
url="https://github.com/escherba/python-cityhash"
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('BSD')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/escherba/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5d7a43e0ed846356d252ac8313f0825f49fe6dc678233088f136e75e2f8905ee')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH=src pytest tests
}
