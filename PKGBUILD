# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-autograd'
_pkgname='autograd'
pkgver='1.7.0'
pkgrel=1
pkgdesc="Efficiently computes derivatives of numpy code"
url="https://github.com/HIPS/autograd"
depends=('python'
    'python-numpy'
    'python-scipy')
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('de743fd368d6df523cd37305dcd171861a9752a144493677d2c9f5a56983ff2f')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}

