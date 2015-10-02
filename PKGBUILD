# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-yapsy-hg
pkgname=('python-yapsy-hg' 'python2-yapsy-hg')
pkgver=386.09ae8fccba69
pkgrel=1
pkgdesc='Yet another plugin system (hg version)'
arch=('any')
url='http://yapsy.sourceforge.net/'
license=('BSD')
makedepends=('mercurial' 'python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("hg+http://hg.code.sf.net/p/yapsy/code")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/code/package"
  cp -R "${srcdir}/code/package" "${srcdir}/code/package-py2"
}

package_python-yapsy-hg() {
  depends=('python' 'python-setuptools')
  provides=('python-yapsy')
  conflicts=('python-yapsy')
  cd "${srcdir}/code/package"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-yapsy-hg() {
  depends=('python2' 'python2-setuptools')
  provides=('python2-yapsy')
  conflicts=('python2-yapsy')
  cd "${srcdir}/code/package-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

pkgver() {
  cd "${srcdir}/code/package"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:
