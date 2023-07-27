# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-octodns-git
_pkgname=octodns
pkgdesc="Tools for managing DNS across multiple providers"
url="https://github.com/octodns/octodns"
provides=("python-octodns")
conflicts=("python-octodns")
pkgver=v1.0.0rc1.r0.g7b2a1d4
pkgrel=1
arch=("any")
license=("MIT")
makedepends=("python-setuptools")
depends=(
    "python"
    "python-dnspython"
    "python-yaml"
    "python-requests"
    "python-natsort"
    "python-pycountry"
    "python-pycountry-convert"
    "python-dateutil"
    "python-fqdn"
)
source=("${pkgname}::git+$url")
b2sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
