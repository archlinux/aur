# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pybase='cement'
pkgbase="python-${_pybase}"
pkgname=(python{,2}-${_pybase})
pkgver='2.6.2'
pkgrel='1'
pkgdesc='CLI Application Framework'
#url="https://pypi.python.org/pypi/${_pybase}/"
url='http://builtoncement.com/'
makedepends=(python{,2}{,-distribute}) # ,-sphinx,-nose,-coverage,-pep8,-autopep8,-mock,-pystache,-pyyaml,-colorlog})
license=('Apache2') #custom: ISC
arch=('any')
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
_srcdir="${_pybase}-${pkgver}"
source=("http://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('ba547b342c2e327f2509f9424971f7ae9dd61ec884cb62c80f45d88bdf4bd27b')

build() {
  set -u
  cd "${_srcdir}"
  python setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # Way too many unreasonable dependencies to run check
  #python setup.py test --verbose
  set +u
}

package_python-cement() {
  set -u
  depends=('python')
  cd "${_srcdir}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}

package_python2-cement() {
  set -u
  depends=('python2')
  cd "${_srcdir}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
