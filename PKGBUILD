# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-pygal
pkgname=('python-pygal' 'python2-pygal')
_pyname=pygal
epoch=1
pkgver=1.7.0
pkgrel=2
pkgdesc='A Python SVG graph plotting library'
arch=('any')
url='http://pygal.org/'
license=('LGPL3')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fee7a4d2d5ba65dc9507e8c5de7d1da6')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-pygal() {
  depends=('python' 'python-setuptools')
  optdepends=('python-lxml: for XML output through lxml instead of xml.etree'
              'python-cairosvg: for PNG output')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pygal() {
  depends=('python2' 'python2-setuptools')
  optdepends=('python2-lxml: for XML output through lxml instead of xml.etree'
              'python2-cairosvg: for PNG output')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}_gen.py" "${pkgdir}/usr/bin/${_pyname}_gen.py2"
}

# vim:set ts=2 sw=2 et:
