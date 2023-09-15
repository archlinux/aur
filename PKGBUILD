# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-interface-meta'
_pkgname='interface_meta'
pkgver='1.3.0'
pkgrel=2
pkgdesc="A convenient way to expose an API with enforced method signatures"
url="https://github.com/matthewwardrop/interface_meta"
depends=('python')
checkdepends=('python-pytest')
optdepends=()
makedepends=(python-build python-installer python-poetry-dynamic-versioning python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8a4493f8bdb73fb9655dcd5115bc897e207319e36c8835f39c516a2d7e9d79a1')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}
