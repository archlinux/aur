# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=2.5.9
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-httpsig_cffi' 'python-idna' 'python-pytz' 'python-requests' 'python-six' 'python-retrying' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx_oracle-git: Used by the database service')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('25b1b212fe3318937ab2e4b0d3a2b854f854cdbfc37e106aea9fa3244af23a65'
            '42c99752a027fc8c74f2fed333dc66c451e854db2f43b9351f43f1f8bda74b68')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
