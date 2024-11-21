# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=fnv-hash-fast
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast version of fnv1a"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/bdraco/fnv-hash-fast"
license=("MIT")
depends=(python-fnvhash)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('d4c528bfb0daa751afb17419a244b913b094b9f0634f9bd19aeffcdc60192589')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
