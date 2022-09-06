# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.5.2
pkgrel=2

arch=("any")
license=("BSD")

makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
)
depends=(
    "python"
    "python-pypng"
    "pyzbar"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("29236cfb11028c6b43f5b3cb336dd4f6ee7bdfb527bda549c32a739b4353a81d3cff185859693d90c5c70ef7703f4d2cf591829bba83b605f51eabf97f1e4e71")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
