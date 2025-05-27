# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=starlette-compress
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.6.0
pkgrel=1
pkgdesc="Compression middleware for Starlette - supporting ZStd, Brotli and GZip."
arch=('any')
url="https://github.com/Zaczero/starlette-compress"
license=('0BSD')
depends=('python-brotli' 'python-brotlicffi' 'python-starlette' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('72494bfd85eca9c2fdfd340326ac84359722622531d9c90844a12e6fdfb0aedc9c1a785ab5ea8434ed47a851867575d7324cbc8a6baced42e4d53ffb804989e6')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
