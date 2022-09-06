# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-cykhash"
_name=${pkgname#python-}
pkgdesc="cython wrapper for khash-sets/maps, efficient implementation of isin and unique"
url="https://github.com/realead/cykhash/"

pkgver=2.0.0
pkgrel=3

arch=("x86_64")
license=("MIT")

makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/realead/cykhash/v${pkgver}/LICENSE"
)
b2sums=(
    "263d500e55d01bfdfa7b68e9cca4dd5f7c7b5001e816c90c695c0a48c0d65218968a5b9a6da7213c293ef6f25b3f6f2043d73daafc7b76749b042d5c8fc7b0f3"
    "d86079e188ebdb8768b9cedf361726b249a58adcffc82c8b8a2f98d5179aee265dd346fca6e4b56ac44e1296a06c69f0b3cdbed0a10b271a12fb2a7d612cc303"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
