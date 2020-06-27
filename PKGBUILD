# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.17.0
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-pyopenssl' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('d05b4492ff2334e65e8f353763f2aa21a72eb86bcc8445d0a354eee4f2fb87f3'
            'c98ecfe8960ee5fb293485b5e63c48b25824b0ae60deaa29d35e1701e84ddf3a')

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
