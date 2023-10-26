# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.5.3
pkgrel=1

arch=("any")
license=("BSD")

makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python"
    "python-pypng"
    "pyzbar"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("9e20d53917445698c9d64a728d057c783610ec2cc25e619a55813c0300ac3502efc153c8e2e67ae39ecd30bd9e53ff9be21c869ab1fe7a3c5d2bb1afe3ddf0bf")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
