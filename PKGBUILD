# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-formulaic'
_pkgname='formulaic'
pkgver='0.2.4'
pkgrel=1
pkgdesc="A high performance of Wilkinson formulas in Pythonn"
url="https://github.com/matthewwardrop/formulaic"
depends=('python'
    'python-astor'
    'python-numpy'
    'python-pandas'
    'python-scipy'
    'python-wrapt')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setupmeta' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('15b71ea8972fb451f80684203cddd49620fc9ed5c2e35f31e0874e9c41910d1a')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}
