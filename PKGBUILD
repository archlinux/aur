# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-tabulator"
_name=${pkgname#python-}
pkgdesc="Consistent interface for stream reading and writing tabular data (csv/xls/json/etc)"
url="https://github.com/frictionlessdata/tabulator-py"

pkgver=1.35.0
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-boto3"
    "python-cchardet"
    "python-click"
    "python-ijson"
    "python-jsonlines"
    "python-linear-tsv"
    "python-openpyxl"
    "python-requests"
    "python-six"
    "python-sqlalchemy"
    "python-unicodecsv"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(
    "986e6419e916bc6e5473d5f6c779002fc6b38e08415eab9f3b15a08b1f9aa20c"
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
