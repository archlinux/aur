# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-doit-git
pkgname=('python-doit-git' 'python2-doit-git')
_pyname=doit
_gitname=doit
pkgver=0.28.0.r1.gdcefd21
pkgrel=1
pkgdesc='doit automation tool (git version)'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
makedepends=('git' 'python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-pyinotify' 'python-six' 'python2-pyinotify' 'python2-six')
options=(!emptydirs)
source=("git+https://github.com/pydoit/${_gitname}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_gitname}"
  cp -R "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-py2"
}

package_python-doit-git() {
  depends=('python' 'python-pyinotify' 'python-six' 'python-setuptools')
  provides=('python-doit')
  conflicts=('python-doit')
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-doit-git() {
  depends=('python2' 'python2-pyinotify' 'python2-six' 'python2-setuptools')
  provides=('python2-doit')
  conflicts=('python2-doit')
  cd "${srcdir}/${_gitname}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

# vim:set ts=2 sw=2 et:
