# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.0.1
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('any')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-pyjwt' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-idna' 'python-pyopenssl' 'python-pytz' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('16104fd3e91e63e3f4e26ec5918f2f88d3bc2bdd9f59b13dee84edcdd7c52464'
            '7b5aff0f664695342f31093be2f9b16c853adaed26122f85adfbc008ad3d8c0b')

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
