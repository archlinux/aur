# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-cykhash"
_name=${pkgname#python-}
pkgdesc="cython wrapper for khash-sets/maps, efficient implementation of isin and unique"
url="https://github.com/realead/cykhash/"

pkgver=1.0.2
pkgrel=2

arch=("x86_64")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "cython"
    "python"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/realead/cykhash/v${pkgver}/LICENSE"
)
sha256sums=(
    "2ed17bffaccce3564407f41fce96ed79cc00a72427b3957674ea89148c1844e1"
    "57198bc2af5d7f35e74bcd390539d43229a966f4307dfd1eea1c63ccb1c56d54"
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
