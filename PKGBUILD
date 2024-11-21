# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=atomicwrites-homeassistant
_pipname="${_pkgname}"
pkgname="python-${_pkgname}"
pkgver=1.4.1
pkgrel=1
pkgdesc="Atomic file writes on POSIX (homeassistant fork)"
arch=('any')
url="https://pypi.org/project/atomicwrites-homeassistant"
license=("MIT")
provides=("python-atomicwrites")
conflicts=("python-atomicwrites")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('256a672106f16745445228d966240b77b55f46a096d20305901a57aa5d1f4c2f')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
