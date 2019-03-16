# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=2.5.3
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('any')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-httpsig_cffi' 'python-idna' 'python-pytz' 'python-requests' 'python-six' 'python-retrying' 'python-yaml' 'python-cx_oracle-git')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('379de4d8891004edf22313d5bb9ef0dd183405ae16a48001cfdb3b3d9329dca5'
            '302c4878f786518cb0589187f73f82e2a66eaeba1107c8486f920c4bd1f2bb43')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../${pkgname}.patch
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
