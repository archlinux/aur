# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgbase=pypy-zope-event
pkgname=('pypy-zope-event' 'pypy3-zope-event')
pkgver=4.2.0
pkgrel=1
pkgdesc="Provides a simple event system"
arch=(any)
license=('ZPL')
url="https://github.com/zopefoundation/zope.event"
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("https://github.com/zopefoundation/zope.event/archive/${pkgver}.tar.gz")
sha256sums=('20b0a3abe0dadfac853f9922287e598cce8f73b9dcfd68c10aaf6f897d0dfd7f')

prepare() {
  cp -a zope.event-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/zope.event-${pkgver}"
  pypy3 setup.py build

  cd "${srcdir}/zope.event-${pkgver}-py2"
  pypy setup.py build
}

check() {
  cd "${srcdir}/zope.event-${pkgver}"
  pypy3 setup.py test

  cd "${srcdir}/zope.event-${pkgver}-py2"
  pypy setup.py test
}

package_pypy3-zope-event() {
  depends=('pypy3')
  cd "$srcdir/zope.event-$pkgver"
  pypy3 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/opt/pypy3
}

package_pypy-zope-event() {
  depends=('pypy')
  cd "$srcdir/zope.event-$pkgver"
  pypy setup.py install --root="$pkgdir/" --optimize=1 --prefix=/opt/pypy
}

# vim:set ts=2 sw=2 et:
