# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=environs
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=11.2.0
pkgrel=1
pkgdesc="simplified environment variable parsing"
arch=('any')
url="https://github.com/sloria/${_pkgname}"
license=('MIT')
depends=(python-marshmallow python-dotenv)
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('87c5759dad117ebd36d8d10a24caf13ec1056b6cd42343a758b08ac6b9195be0')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
