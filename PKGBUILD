# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=typing-inspection
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Runtime typing introspection tools"
arch=('any')
url="https://github.com/pydantic/${_pkgname}"
license=('MIT')
depends=("python-typing_extensions")
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
