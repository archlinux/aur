# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.6.1
pkgrel=1

arch=("any")
license=("BSD")

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

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("c23081413c1d3850bda5b495e8b3d0eeb21010d0100d0477d0915dca12da2463e2fbe1482596b57b621ac5dc7cddc30e31e8fd94a83b4a56e68ab003e5df7e75")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
