# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=bluetooth-auto-recovery
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.4.2
pkgrel=1
pkgdesc="Recover bluetooth adapters that are in an stuck state"
arch=('any')
url="https://github.com/bluetooth-devices/bluetooth-auto-recovery"
license=("MIT")
depends=(python-bluetooth-adapters python-btsocket python-pyric python-usb-devices)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('7146bacf1864b07c6ef0ed989b8e7784aa5597426a80c05735558f72b255b7d8')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
