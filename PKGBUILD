# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-pyroma
pkgname=('python-pyroma' 'python2-pyroma')
_pyname=pyroma
pkgver=1.8.2
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url='https://bitbucket.org/regebro/pyroma'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-docutils' 'python2-docutils')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7490b824c1bf3713660746f06ed1c68b')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-pyroma() {
  depends=('python' 'python-setuptools' 'python-docutils')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-pyroma() {
  depends=('python2' 'python2-setuptools' 'python2-docutils')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
