# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.2.8
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-pyjwt' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-idna' 'python-pyopenssl' 'python-pytz' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('893cda37f9c111d92592dc736c9b714b3a8716f5fe21460f4249fc80419db427'
            '192c6f1297b77ebf03507b79ca2d2cda851feb244c4ebb01ca08e77b54f4ad02')

prepare() {
  cd "${_pyname}-${pkgver}"

  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
