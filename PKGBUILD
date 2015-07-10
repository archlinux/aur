# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-pyroma-hg
pkgname=('python-pyroma-hg' 'python2-pyroma-hg')
_pyname=pyroma
_hgname=pyroma
pkgver=158.70566accf97f
pkgrel=1
pkgdesc="Test your project's packaging friendliness (hg version)"
arch=('any')
url='https://bitbucket.org/regebro/pyroma'
license=('MIT')
makedepends=('mercurial' 'python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-docutils' 'python2-docutils')
options=(!emptydirs)
source=("hg+https://bitbucket.org/regebro/${_hgname}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_hgname}"
  cp -R "${srcdir}/${_hgname}" "${srcdir}/${_hgname}-py2"
}

package_python-pyroma-hg() {
  depends=('python' 'python-setuptools' 'python-docutils')
  provides=('python-pyroma')
  conflicts=('python-pyroma')
  cd "${srcdir}/${_hgname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-pyroma-hg() {
  depends=('python2' 'python2-setuptools' 'python2-docutils')
  provides=('python2-pyroma')
  conflicts=('python2-pyroma')
  cd "${srcdir}/${_hgname}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

pkgver() {
  cd "${srcdir}/${_hgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:
