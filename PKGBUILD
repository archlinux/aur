# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pandana"
_name=${pkgname#python-}
pkgdesc="A Python library for network analysis"
url="http://udst.github.io/pandana/"

pkgver=0.6.1
pkgrel=6

arch=("any")
license=("AGPL")

makedepends=(
    "cython"
    "python-build"
    "python-installer"
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
    "${pkgname}-language-level-3.patch"
)
b2sums=(
    "707512889661289e470ad1a9ec815258cc055d9ac5f4247e0d44a3f33e2b2995df8c69c45ec4a92e276339b8e6f0ce3615f1da2592ae81943857bc15f1420757"
    "07782d7b23c719a0957f6680defbfa1a374419d9306fb7dc4f72169470e3c082392d6f91c665f3193254e6921d427846fb5bbe24929e40e6192eb749687fc3c4"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/${pkgname}-language-level-3.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
