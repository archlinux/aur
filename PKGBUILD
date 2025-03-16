# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pgvector
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="pgvector support for Python"
arch=('any')
url="https://github.com/pgvector/pgvector-python"
license=('MIT')
depends=(python-numpy)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('f909f8e8081b57fb8a2442c36c3a1e521228d0d4ad66100c28c674806ff62688')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
