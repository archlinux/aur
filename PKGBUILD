# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=aiooui
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.1.7
pkgrel=1
pkgdesc="Async OUI lookups"
arch=('any')
url="https://github.com/Bluetooth-Devices/aiooui"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b390c9e602de1faecf3c1f0b98270a95e2d00a4da208a62d507a9635ab8a5d05')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" "dist/${_pipname}-${pkgver}"-*-none-any.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
