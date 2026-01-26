# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pymilvus
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.6.7
pkgrel=1
pkgdesc="Python Sdk for Milvus"
arch=('any')
url="https://github.com/milvus-io/${_pkgname}"
license=('Apache-2.0')
depends=(python-grpcio python-milvus-lite python-pandas python-protobuf python-dotenv python-setuptools python-ujson)
makedepends=('python-build' 'python-gitpython' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('8667e98f977d73cfbc6bc2379bf1abf56378c4ff01c6b078e0dad44213e69b1d16bb5d1932922bd59597eb41fc0e47a7fc7c8e0e3886ecc245c0f83a21104dba')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
