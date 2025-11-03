# Maintainer: devome <evinedeng@hotmail.com>

_pipname=httpx_kerberos
_pkgname=${_pipname//_/-}
pkgname="python-${_pkgname}"
pkgver=0.1.2
pkgrel=1
pkgdesc="Kerberos authentication for HTTPX"
arch=("any")
url="https://github.com/raid-newvicx/${_pipname}"
license=('MIT')
depends=("python-cryptography" "python-httpx" "python-pyspnego")
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ae47ddbe9468dfee49e79477baeb5237143ecf483ecef15ea4b4a9c86a961264')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
