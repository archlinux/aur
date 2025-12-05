# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pgvector
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.2
pkgrel=1
pkgdesc="pgvector support for Python"
arch=('any')
url="https://github.com/pgvector/pgvector-python"
license=('MIT')
depends=(python-numpy)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('59d00d9de6e91ab0420f75bf0af6e88d89aedc5078142205a5f19f31afe556eb7948afb00024479729f505c144fc662eb6564af615f643826563d30397a8cabf')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
