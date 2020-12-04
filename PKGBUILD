# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-tableschema"
_name=${pkgname#python-}
pkgdesc="Parse messy tabular data in various formats"
url="https://github.com/frictionlessdata/tableschema-py"

pkgver=1.15.0
pkgrel=2

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-click"
    "python-dateutil"
    "python-isodate"
    "python-jsonschema"
    "python-requests"
    "python-rfc3986"
    "python-six"
    "python-tabulator"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(
    "3b5668a8a73e215967220e3ed7df31135ccf9041d5f94df5c8eebabddecc66ba"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
