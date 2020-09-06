# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=1.0.0
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

source=("https://gitlab.com/christoph.fink/metatube/uploads/ccca9f26e4c4a11c80a1e0d3805b3134/metatube-1.0.0.tar.gz")
sha256sums=("b8f89982565400cb93c82f30a7970e0caa50b191fdf1479856ec7c29ffb459ab")

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
