# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=bleak-retry-connector
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=3.6.0
pkgrel=1
pkgdesc="A connector for Bleak Clients that handles transient connection failures"
arch=('any')
url="https://github.com/bluetooth-devices/bleak-retry-connector"
license=("MIT")
depends=(python-async-timeout python-bleak python-bluetooth-adapters python-dbus-fast)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('2be9f2eaf2e83fd1f87170caefbf0e992b192df8634df81d937d626ed0ec5148')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
