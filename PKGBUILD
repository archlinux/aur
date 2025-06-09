# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=starlette-compress
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.6.1
pkgrel=1
pkgdesc="Compression middleware for Starlette - supporting ZStd, Brotli and GZip."
arch=('any')
url="https://github.com/Zaczero/starlette-compress"
license=('0BSD')
depends=('python-brotli' 'python-brotlicffi' 'python-starlette' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('6a54034923158b2f7fd3fb97a2b8bbe66fbf5bb26b1c8dfd17a4145cdcbc8b337049ef324358019c28c983dddafe7552e6b5b419ff2a380a4524b2f314b20f21')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
