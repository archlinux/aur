# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Maintainer: Yaron de Leeuw <me@jarondl.net>
pkgbase=python-natsort
pkgname=('python-natsort' 'python2-natsort')
_pyname=natsort
pkgver=5.0.2
pkgrel=1
pkgdesc='Sort lists naturally.'
arch=('any')
url='https://github.com/SethMMorton/natsort'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('14d5593c8320a547b71a0fe74a99247c')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-natsort() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-natsort() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
