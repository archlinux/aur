# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pymilvus
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.6.8
pkgrel=1
pkgdesc="Python Sdk for Milvus"
arch=('any')
url="https://github.com/milvus-io/${_pkgname}"
license=('Apache-2.0')
depends=(python-grpcio python-milvus-lite python-pandas python-protobuf python-dotenv python-setuptools python-ujson)
makedepends=('python-build' 'python-gitpython' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('1ad441a6971270f14b9da5e0af2f538efd3ae4aa3a80db3ab7ab2119aa5cc152ec6e7ce96e65f30a7df1563312d5eeb08577e323d5930f1a2c0adaa9e21acac8')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
