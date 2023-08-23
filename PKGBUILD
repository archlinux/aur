# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.110.2
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url="https://github.com/oracle/${_pyname}"
license=('Apache')
depends=('python' 'python-dateutil' 'python-certifi' 'python-circuitbreaker' 'python-cryptography' 'python-pyopenssl' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('82fa262e87d3d0da7265c61468a50ac3ca4e46b23526a6bb6bd4020e55936035')

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
