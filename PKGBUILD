# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=qdrant-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.15.0
pkgrel=1
pkgdesc="Client library for the Qdrant vector search engine"
arch=('any')
url="https://github.com/qdrant/qdrant-client"
license=('Apache-2.0')
depends=(python-grpcio python-grpcio-tools python-httpx python-numpy python-portalocker python-pydantic python-urllib3)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-fastembed python-fastembed-gpu)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('b44bd35f61adfef4220ac52068aa78148c76fd606db45e809fb690bd0f7234cb7fa12145bb245b118f456f1488dca7e39ca7e4a79491575366295fc971ee9395')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
