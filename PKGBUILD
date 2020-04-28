# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=0.0.5
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

source=("https://gitlab.com/christoph.fink/metatube/uploads/a602fa861cc0903992ddc028afdef96e/metatube-0.0.5.tar.gz")
sha256sums=("f89ce4ba705a73882cc0df47404fa3e2e515b63c45421aba262bed9e30bedc81")

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
