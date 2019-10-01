# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-libconfigparser' 'python2-libconfigparser')
_pkgname=configparser
pkgver=4.0.2
pkgrel=1
pkgdesc="backport of configparser from Python 3"
arch=('any')
url="https://github.com/jaraco/configparser"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/16/4f/48975536bd488d3a272549eb795ac4a13a5f7fcdc8995def77fbef3532ee/${_pkgname}-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/jaraco/configparser/master/LICENSE"
)
sha256sums=('c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df'
  'a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd')

prepare() {
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}-2"
  sed -i 's/env python/env python2/' "${srcdir}/${_pkgname}-${pkgver}-2/src"/*.py
  sed -i 's/env python/env python2/' "${srcdir}/${_pkgname}-${pkgver}-2/src/backports/configparser"/*.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py build
}

package_python-libconfigparser() {
  depends=('python')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-libconfigparser() {
  depends=('python2')
  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
