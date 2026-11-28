# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.193.0
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('any')
options=('!strip')
url="https://github.com/oracle/${_pyname}"
license=('Apache-2.0 OR UPL-1.0')
depends=('python' 'python-aiohttp' 'python-dateutil' 'python-certifi' 'python-circuitbreaker' 'python-crc32c' 'python-cryptography' 'python-pyjwt' 'python-pyopenssl' 'python-pytz' 'python-urllib3')
makedepends=('python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9fa105019c8f99f7bd6e8430a1dd75a75116015edd40f05a3ac553963528b012')

prepare() {
  cd "${_pyname}-${pkgver}"

  sed -i -r 's/ *;[^"]*"/"/g; s/(==|>|<)[^"]*"/"/g' setup.py
  sed -i '/configparser/d' setup.py
}

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
