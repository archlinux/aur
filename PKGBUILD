# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.72.0
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url="https://github.com/oracle/${_pyname}"
license=('Apache')
depends=('python' 'python-dateutil' 'python-certifi' 'python-circuitbreaker' 'python-cryptography' 'python-pyopenssl' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f125ea5873a2f675507eb83662704e8a6c47f1205372b13203587f886b598c92')

prepare() {
  cd "${_pyname}-${pkgver}"

  sed -i -r 's/(==|>|<).*"/"/g' setup.py
  sed -i '/configparser/d' setup.py
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
