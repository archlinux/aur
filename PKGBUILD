# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=0.1.0
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

source=("https://gitlab.com/christoph.fink/metatube/uploads/4a71d800cf151a75158e2a98829ae034/metatube-0.1.0.tar.gz")
sha256sums=("53fdcc8161687b6a0a11677b7025998d39888f3eb3af1be44d889b8a960c4dc2")

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
