# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-twine
pkgname=('python-twine' 'python2-twine')
_pyname=twine
pkgver=1.5.0
pkgrel=1
pkgdesc='A utility for interacting with PyPI'
arch=('any')
url='https://pypi.python.org/pypi/twine'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('12948245aeb59acf32f663e1d81fed34')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-twine() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-twine() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
