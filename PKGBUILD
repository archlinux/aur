# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgbase=pypy-zope-interface
pkgname=('pypy-zope-interface' 'pypy3-zope-interface')
pkgver=5.0.0
pkgrel=1
pkgdesc="Zope Interfaces"
license=('ZPL')
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/zope.interface"
makedepends=('pypy-setuptools' 'pypy3-setuptools')
checkdepends=('pypy-zope-event' 'pypy3-zope-event')
source=("https://pypi.python.org/packages/source/z/zope.interface/zope.interface-${pkgver}.tar.gz")
sha256sums=('9da542aa8fb13671e3aa03722cf479dc3611a4e767de256629d609bcb2e99285')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup zope.interface-$pkgver pypy3zope.interface-$pkgver
}

build() {
  # build for pypy
  cd zope.interface-$pkgver
  pypy setup.py build

  # build for pypy3
  cd ../pypy3zope.interface-$pkgver
  pypy3 setup.py build
}

# check faiks for both versions, disabled for now.
#check() {
#  cd zope.interface-${pkgver}
#  pypy setup.py test

#  cd pypy3zope.interface-${pkgver}
#  pypy3 setup.py test
#}

package_pypy-zope-interface(){
  depends=('pypy')
  pkgdesc+=' for Pypy'

  cd zope.interface-${pkgver}
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}

package_pypy3-zope-interface() {
  depends=('pypy3')
  pkgdesc+=' for Pypy 3'

  cd pypy3zope.interface-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
