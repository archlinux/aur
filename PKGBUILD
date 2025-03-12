# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.6.6
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
b2sums=("41f3739485bd4177d8d47269b246ac12ff765acec78f088c0329a1b0fa58f86c2fcc4273113ef3743c28df21013abe5abd3449ed7e1802464de7357b9c0af1b4")

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
