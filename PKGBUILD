# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-cykhash"
_name=${pkgname#python-}
pkgdesc="cython wrapper for khash-sets/maps, efficient implementation of isin and unique"
url="https://github.com/realead/cykhash/"

pkgver=2.0.1
pkgrel=4

arch=("x86_64")
license=("MIT")

depends=(
    "python"
)
makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/realead/cykhash/fdecec4/LICENSE"
)
b2sums=(
    "c6583717bbf6d20d0e060ae36191846be3a570b0852e43e0081ddd43dfd3f4bbacd44a96f140a40dbf50d7192322a3b228da6c3ffe5c7f4b84acb7f41c045e81"
    "d86079e188ebdb8768b9cedf361726b249a58adcffc82c8b8a2f98d5179aee265dd346fca6e4b56ac44e1296a06c69f0b3cdbed0a10b271a12fb2a7d612cc303"
)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
