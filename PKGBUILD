# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name=colorzero
pkgbase="python-${_name}"
pkgname=("${pkgbase}" "python2-${_name}")
pkgver=1.1
pkgrel=1
arch=('any')
url="https://${_name}.readthedocs.org/"
license=('BSD')
depends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('acba47119b5d8555680d3cda9afe6ccc5481385ccc3c00084dd973f7aa184599')


prepare() {
  cp -r "${_name}-${pkgver}" "python2-${_name}-${pkgver}"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-${_name}-${pkgver}"
  python2 setup.py build
}

package_python-colorzero() {
  pkgdesc="A simple to use and pythonic color manipulation library"
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-colorzero() {
  pkgdesc="A simple to use and pythonic color manipulation library (Python 2)"
  depends=('python2')

  cd "${srcdir}/python2-${_name}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
