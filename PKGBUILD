# $Id$
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgbase=pypy-appdirs
pkgname=(pypy-appdirs pypy3-appdirs)
pkgver=1.4.3
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=('any')
url="https://github.com/ActiveState/appdirs"
license=('MIT')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("https://pypi.io/packages/source/a/appdirs/appdirs-$pkgver.tar.gz")
md5sums=('44c679904082a2133f5566c8a0d3ab42')

prepare() {
  cp -a appdirs-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/appdirs-$pkgver
  pypy3 setup.py build

  cd "$srcdir"/appdirs-$pkgver-py2
  pypy setup.py build
}

check() {
  cd "$srcdir"/appdirs-$pkgver
  pypy3 setup.py test

  cd "$srcdir"/appdirs-$pkgver-py2
  pypy setup.py test
}

package_pypy3-appdirs() {
  depends=('pypy3')

  cd appdirs-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_pypy-appdirs() {
  depends=('pypy')

  cd appdirs-$pkgver-py2
  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
