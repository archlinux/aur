# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.28.0
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-pyopenssl' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('20f9d9a7fb465d5a5646db7b6c41f1313d808b94141627ad090aabd6797ec5a5'
            '4112aa35c274c66e3f99814a259eb13d1d1543f40b139a0734e7c846c656cf36')

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
