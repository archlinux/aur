# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgbase=pypy-zope-event
pkgname=('pypy-zope-event' 'pypy3-zope-event')
pkgver=4.4
pkgrel=1
pkgdesc="Provides a simple event system"
arch=(any)
license=('ZPL')
url="https://github.com/zopefoundation/zope.event"
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("https://github.com/zopefoundation/zope.event/archive/${pkgver}.tar.gz")
sha256sums=('64a7f9472f5a11b0239270ff40f6854083b3905238a415729067dcfa735856d5')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup zope.event-$pkgver pypy3zope.event-$pkgver
}

build() {
  cd zope.event-${pkgver}
  pypy setup.py build

  cd ../pypy3zope.event-${pkgver}
  pypy3 setup.py build
}

check() {
  cd zope.event-${pkgver}
  pypy setup.py test

  cd ../pypy3zope.event-${pkgver}
  pypy3 setup.py test
}

package_pypy-zope-event() {
  depends=('pypy')
  pkgdesc+=" for Pypy"

  cd zope.event-$pkgver
  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir/" --optimize=1
}

package_pypy3-zope-event() {
  depends=('pypy3')
  pkg_desc+=" for Pypy 3"

  cd pypy3zope.event-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
