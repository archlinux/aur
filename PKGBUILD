# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=2.4.28
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('any')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-httpsig_cffi' 'python-idna' 'python-pytz' 'python-requests' 'python-six' 'python-retrying')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('35b380e1bf3319a0e9f2bc9ec3d1ac2a7cec64b07da4a0b2da1763d7925d7ec6'
            '984e15e0858ab0d45732a46124a9a882e59b6d299858e3a13d3b4fbcaaa73cad')

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
