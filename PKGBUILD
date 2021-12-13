# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-cykhash"
_name=${pkgname#python-}
pkgdesc="cython wrapper for khash-sets/maps, efficient implementation of isin and unique"
url="https://github.com/realead/cykhash/"

pkgver=2.0.0
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
    "ab2e7b3a701291f71df626d8fe597a50b097c1b33e25b4c37681415639d270fd"
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
