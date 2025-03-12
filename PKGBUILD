# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.6.5
pkgrel=1

arch=("any")
license=("BSD-3-Clause")

depends=(
    "python"
)
makedepends=(
    "python-build"
    "python-flit-core"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pillow"
    "python-pypng"
    "python-pytest"
    "python-pytest-cov"
    "python-qrcode-artistic"
    "pyzbar"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('4106cc1032969520c18e3e9df355b6af9b4509288f172866f285b137422ceddc8ddc0f630990e6a670259c76fbae4bdcf31e32459ec28df96ce947ea2693f3bc')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check(){
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
