# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-doit
pkgname=('python-doit' 'python2-doit')
_pyname=doit
pkgver=0.29.0
pkgrel=3
pkgdesc='doit automation tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-pyinotify' 'python-six' 'python-cloudpickle'
             'python2-pyinotify' 'python2-six' 'python2-cloudpickle')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9968e1a669bad0a999212ab9f5c591a3')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-doit() {
  depends=('python' 'python-pyinotify' 'python-six' 'python-setuptools' 'python-cloudpickle')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
  install -D -m755 'zsh_completion_doit' "${pkgdir}/usr/share/zsh/site-functions/_${_pyname}"
  install -D -m755 'bash_completion_doit' "${pkgdir}/usr/share/bash-completion/completions/${_pyname}"
}

package_python2-doit() {
  depends=('python2' 'python2-pyinotify' 'python2-six' 'python2-setuptools' 'python2-cloudpickle')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
