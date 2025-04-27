# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pgvector
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.1
pkgrel=1
pkgdesc="pgvector support for Python"
arch=('any')
url="https://github.com/pgvector/pgvector-python"
license=('MIT')
depends=(python-numpy)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('3a852b6d09227919288fed97fc2c72389ff5bf006ae5a9ca01f55b5fa5022336f82fd3764725da1f99c630db87a6dafc46777872133685fabfe8da302d295751')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
