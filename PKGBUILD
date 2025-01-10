# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=environs
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=14.1.0
pkgrel=1
pkgdesc="simplified environment variable parsing"
arch=('any')
url="https://github.com/sloria/${_pkgname}"
license=('MIT')
depends=(python-marshmallow python-dotenv python-typing-extensions; python_version )
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('a5f2afe9d5a21b468e74a3cceacf5d2371fd67dbb9a7e54fe62290c75a09cdfa')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
