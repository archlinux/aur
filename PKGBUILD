# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.7.0
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-pyjwt' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-idna' 'python-pyopenssl' 'python-pytz' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('7fd92257d2e8fb3429bada0841cd51cb4f6436f966950701490c124a0f1d5431'
            'b5db97cb78bb8c95e045d7d296522eeb321fefe33a369ebc6bc24ddf3cfaa659')

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
