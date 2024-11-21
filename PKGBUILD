# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=habluetooth
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=3.6.0
pkgrel=1
pkgdesc="High availability Bluetooth"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/bluetooth-devices/habluetooth"
license=("Apache-2.0")
depends=(python-async_interrupt python-bleak python-bleak-retry-connector python-bluetooth-adapters python-bluetooth-auto-recovery python-bluetooth-data-tools)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('df79914d9037456b370ba790bac71ca23fd16871c202aac93df5f800119137e6')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
