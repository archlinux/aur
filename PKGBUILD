# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-shadow-useragent"
_name=${pkgname#python-}
pkgdesc="Pick the most common user-agents on the Internet"
url="https://github.com/lobstrio/shadow-useragent"

pkgver=0.0.17
pkgrel=0

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-coloredlogs"
    "python-pytz"
    "python-requests"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/lobstrio/shadow-useragent/master/LICENSE"
)
sha256sums=(
    "ace3f53c0ec697b36eb35bb04ccc04d4727bf924edd5bf7caad78b64d272d755"
    "55c77c92b416cef25358a86bfaf96568b5fdead5914ccebd681893b874fa3bba"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
