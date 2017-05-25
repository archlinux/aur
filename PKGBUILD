# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-cityhash')
pkgver='0.2.2'
pkgrel=1
pkgdesc="Python bindings for CityHash"
url="https://github.com/escherba/python-cityhash"
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://github.com/escherba/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('416be242ee955a8c0875d03b6db19589a1b750436095b77b10444b3ae7d09934')

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
