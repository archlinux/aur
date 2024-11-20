# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pgvector
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.6
pkgrel=1
pkgdesc="pgvector support for Python"
arch=('any')
url="https://github.com/pgvector/pgvector-python"
license=('MIT')
depends=(python-numpy)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('31d01690e6ea26cea8a633cde5f0f55f5b246d9c8292d68efdef8c22ec994ade')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
