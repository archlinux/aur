# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-cloudpickle
pkgname=('python-cloudpickle' 'python2-cloudpickle')
_pyname=cloudpickle
pkgver=0.5.2
pkgrel=1
pkgdesc='Extended pickling support for Python objects'
arch=('any')
url='https://github.com/cloudpipe/cloudpickle'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d0f6fc27882f865f2eb185fb0a32c84b')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-cloudpickle() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  #ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-cloudpickle() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  #mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
