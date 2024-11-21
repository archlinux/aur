# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=btsocket
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Python library for BlueZ Bluetooth Management API"
arch=('any')
url="https://github.com/ukBaz/python-btsocket"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('7ea495de0ff883f0d9f8eea59c72ca7fed492994df668fe476b84d814a147a0d')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
