# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=3.1.0
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-idna' 'python-pytz' 'python-six' 'python-retrying' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx_oracle-git: Used by the database service')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eb256e0887d6b64c0559c48bf5ac4d22d77bd7c9494d62221b9f0b31247fc88d')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i -r "s/(==|>|<).*'/'/g" setup.py
  sed -i '/configparser/d' setup.py
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
