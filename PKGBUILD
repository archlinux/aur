# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-oci
_pyname=oci-python-sdk
pkgver=2.14.2
pkgrel=1
pkgdesc='Python SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-python-sdk'
license=('Apache')
depends=('python' 'python-dateutil' 'python-certifi' 'python-cryptography' 'python-pyopenssl' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('642a3d2fcbbb91a218baddd086c85f547ebd46d79954145a729fbcfd62085951'
            'ba94872ccd2945d984f2164cc63d6e8f32e4cb2254b3b95bf8dd6b61af27eb98')

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
