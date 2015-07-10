# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-doit
pkgname=('python-doit' 'python2-doit')
_pyname=doit
pkgver=0.28.0
pkgrel=1
pkgdesc='doit automation tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-pyinotify' 'python-six' 'python2-pyinotify' 'python2-six')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('ff08327b41d8d0f97bbb7ad1885a366a'
         '7d6fd7c8e022bae9010af272c31eb45f')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-doit() {
  depends=('python' 'python-pyinotify' 'python-six' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
}

package_python2-doit() {
  depends=('python2' 'python2-pyinotify' 'python2-six' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
}

# vim:set ts=2 sw=2 et:
