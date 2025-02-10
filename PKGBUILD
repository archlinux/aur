# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=environs
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=14.1.1
pkgrel=1
pkgdesc="simplified environment variable parsing"
arch=('any')
url="https://github.com/sloria/${_pkgname}"
license=('MIT')
depends=(python-marshmallow python-dotenv python-typing-extensions; python_version )
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('03db7ee2d50ec697b68814cd175a3a05a7c7954804e4e419ca8b570dc5a835cf')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
