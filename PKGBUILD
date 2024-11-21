# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=usb-devices
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.5
pkgrel=1
pkgdesc="Tools for mapping, describing, and resetting USB devices"
arch=('any')
url="https://github.com/Bluetooth-Devices/usb-devices"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('9b5c7606df2bc791c6c45b7f76244a0cbed83cb6fa4c68791a143c03345e195d')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
