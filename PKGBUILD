# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=2.4.29
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('any')
url='https://github.com/oracle/oci-cli'
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-httpsig_cffi' 'python-idna' 'python-pytz' 'python-requests' 'python-six' 'python-retrying')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('c593fc7810193b343b9291bc37e3e5295ca10a2e117e6916a8f61b3b76e3f067'
            'a54477bbd655a0b07c7092ddbd19bfa7b3e6cc09d450a87b82c55c19ff432495')

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
