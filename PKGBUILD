# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-interface-meta'
_pkgname='interface_meta'
pkgver='1.2.4'
pkgrel=1
pkgdesc="A convenient way to expose an API with enforced method signatures"
url="https://github.com/matthewwardrop/interface_meta"
depends=('python')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setupmeta' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4c7725dd4b80f97b7eecfb26023e1a8a7cdbb6d6a7207a8e93f9d4bfef9ee566')

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
