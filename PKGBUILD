# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-bbcode-git
pkgname=('python-bbcode-git' 'python2-bbcode-git')
_pyname=bbcode
_gitname=bbcode
pkgver=20151002
pkgrel=1
pkgdesc='A pure python bbcode parser and formatter.  (git version)'
arch=('any')
url='https://pypi.python.org/pypi/bbcode'
license=('BSD')
makedepends=('git' 'python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("git+https://github.com/dcwatson/${_gitname}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_gitname}"
  cp -R "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-py2"
}

package_python-bbcode-git() {
  depends=('python' 'python-setuptools')
  provides=('python-bbcode')
  conflicts=('python-bbcode')
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  #ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-bbcode-git() {
  depends=('python2' 'python2-setuptools')
  provides=('python2-bbcode')
  conflicts=('python2-bbcode')
  cd "${srcdir}/${_gitname}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  #mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

pkgver() {
  date '+%Y%m%d'
}

# vim:set ts=2 sw=2 et:
