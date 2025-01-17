# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pandana"
_name=${pkgname#python-}
pkgdesc="A Python library for network analysis"
url="http://udst.github.io/pandana/"

pkgver=0.7
pkgrel=1

arch=("x86_64")
license=("AGPL-3.0-only")

makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-oldest-supported-numpy"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python"
    "python-numpy"
    "python-pandas"
    "python-pytables"
    "python-requests"
    "python-scikit-learn"
)
optdepends=(
    "python-osmnet"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
    "2635470bd610b419d5a518a341379c4faab9c89fcbbd22184d4e484aa52ba14d4f676004e27eff078b5d9e4f2986f0e824cdcc60400e70436f699680bf360458"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}


package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
