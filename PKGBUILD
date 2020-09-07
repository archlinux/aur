# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=1.0.1
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

source=("https://gitlab.com/christoph.fink/metatube/uploads/d598394ccdcfce81a3a991f80b215c10/metatube-1.0.1.tar.gz")
sha256sums=("5ab13748f29bc9826d3474a6659a938a1dc515054ed6e959f970eddcb0ad1732")

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
