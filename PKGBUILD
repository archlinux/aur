# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.2.17
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-pyjwt' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-idna' 'python-pyopenssl' 'python-pytz' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('293910d218535327004bdd1aa11d3b9a625b81b9d5b3d825156f8615ad73125b'
            'cdafb7d9283e929a4aab7ff91b5fe9a703f46495eddd15782c9a68d285d17a3c')

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
