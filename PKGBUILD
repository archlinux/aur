# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=2.6.9
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-httpsig_cffi' 'python-idna' 'python-pytz' 'python-requests' 'python-six' 'python-retrying' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx_oracle-git: Used by the database service')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('e503d380f2fc680e3ff8db48fc94ea00056999fde35775adc86d21f2574453eb'
            '36c7aa6ea6e2c6bb1ecda71fd7833c424c86bb6afa8784a76cb14aed512bfd6b')

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
