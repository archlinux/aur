# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=starlette-compress
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.7.0
pkgrel=2
pkgdesc="Compression middleware for Starlette - supporting ZStd, Brotli and GZip."
arch=('any')
url="https://github.com/Zaczero/starlette-compress"
license=('0BSD')
depends=('python-brotli' 'python-brotlicffi' 'python-starlette' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz"
    "https://github.com/Zaczero/starlette-compress/blob/main/LICENSE")
b2sums=('ac47bf3c20f064a2500b03d4e507d1bc2bce75e69d711adc1df8a42117d2e8ad3e1f1c102d24fc1619c2675ffb110d20ee39ea3531fdf02882cd5f6cd4e3194b'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
