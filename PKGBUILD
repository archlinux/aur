# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=uart-devices
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.1.0
pkgrel=1
pkgdesc="UART Devices for Linux"
arch=('any')
url="https://github.com/bdraco/uart-devices"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('7f0342c0ba0bc2a4c13c9ead5462dc9feeaca507e5c7017ebd074a69567ad9b1')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
