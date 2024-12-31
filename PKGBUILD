# Contributor:  GI Jack <GI_Jack@hackermail.com>

pkgname='python-ecpy'
_pkgname='ECPy'
pkgver=1.2.5
pkgrel=3
arch=('any')
pkgdesc='Pure Python Elliptic Curve Library for Python'
url='https://github.com/ubinity/ECPy'
license=('custom')
source=("${pkgname}-${pkgver}::https://github.com/cslashm/${_pkgname}/archive/1.2.5.tar.gz")
sha256sums=('02a2e990fe4b9c51a5a2d7518439ad80e5d839c931f76fa5144c50543e6a103f')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Install License
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install Documentation
    install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
