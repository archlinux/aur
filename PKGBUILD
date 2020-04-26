# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-cityhash'
pkgver='0.2.3'
pkgrel=1
pkgdesc="Python bindings for CityHash"
url="https://github.com/escherba/python-cityhash"
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('BSD')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/escherba/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('560093a590958c379d6c8c4d57ff195a7e125be435f8b98282fcdb99b7a954bc')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH=. py.test
}
