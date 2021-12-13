# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pandana"
_name=${pkgname#python-}
pkgdesc="A Python library for network analysis"
url="http://udst.github.io/pandana/"

pkgver=0.6.1
pkgrel=4

arch=("any")
license=("AGPL")

makedepends=(
    "python-setuptools"
)
depends=(
    "cython"
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
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/UDST/pandana/v${pkgver}/LICENSE.txt"
)
sha256sums=(
    "7bcaf6e7bb3faccaf306846bf30838d8e94b3ebd58e971da8c3fe426f1f9288c"
    "cb1cbc85fa3c01c538774e9f2c877c365ad8d1a9264d332f93ef39b5ca8b95cb"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
