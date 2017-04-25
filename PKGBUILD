# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

_pyname=tzlocal
pkgbase=python-${_pyname}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1.4
pkgrel=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/regebro/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('d3cdf502a4ae4b566abf948924e837b6c354aaed082eb1326c6c9043824cb4a7')

prepare() {
  cp -a ${_pyname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/${_pyname}-$pkgver"
  python setup.py build

  cd "${srcdir}/${_pyname}-$pkgver-py2"
  python2 setup.py build
}

package_python2-tzlocal() {
  depends=('python2-pytz')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-tzlocal() {
  depends=('python-pytz')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
