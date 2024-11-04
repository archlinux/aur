# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=environs
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=11.0.0
pkgrel=1
pkgdesc="simplified environment variable parsing"
arch=('any')
url="https://github.com/sloria/${_pkgname}"
license=('MIT')
depends=(python-marshmallow python-dotenv)
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('069727a8f73d8ba8d033d3cd95c0da231d44f38f1da773bf076cef168d312ee8')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
