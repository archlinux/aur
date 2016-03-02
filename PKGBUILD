# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgbase=pypy-zope-interface
pkgname=('pypy-zope-interface' 'pypy3-zope-interface')
pkgver=4.1.3
pkgrel=1
license=('ZPL')
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/zope.interface"
makedepends=('pypy-setuptools' 'pypy3-setuptools')
checkdepends=('pypy-zope-event' 'pypy3-zope-event')
source=("http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${pkgver}.tar.gz")
md5sums=('9ae3d24c0c7415deb249dd1a132f0f79')

prepare() {
  cp -a zope.interface-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy3 setup.py build

  cd "${srcdir}/zope.interface-${pkgver}-py2"
  pypy setup.py build
}

check() {
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy3 setup.py test

  cd "${srcdir}/zope.interface-${pkgver}-py2"
  pypy setup.py test
}

package_pypy3-zope-interface() {
  pkgdesc='Zope Interfaces for Python 3.x (build for pypy)'
  depends=('pypy3')
 
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}

package_pypy-zope-interface(){
  pkgdesc='Zope Interfaces for Python 2.x (build for pypy)'
  depends=('pypy')

  cd "${srcdir}/zope.interface-${pkgver}-py2"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}
