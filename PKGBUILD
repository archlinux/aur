# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=0

pkgdesc="downloads YouTube metadata"
url="https://gitlab.com/christoph.fink/metatube"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
depends=(
    "python-dateparser"
    "python-psycopg2"
    "python-pyaml"
    "python-requests"
)

source=("https://gitlab.com/christoph.fink/metatube/uploads/3401f402e9a826015281a5900af06870/metatube-0.1.1.tar.gz")
sha256sums=("e3ebe343a70fc625adacb9b6dc41ed3fc90a19795f3697f848313e456b4d3ff4")

prepare() {
   rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
   cd "${srcdir}/${_name}-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/${_name}-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
