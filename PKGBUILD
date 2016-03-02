# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=('pypy-urwid' 'pypy3-urwid')
pkgver=1.3.1
pkgrel=1
pkgdesc="Curses-based user interface library."
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
url="http://excess.org/urwid/"
source=(https://pypi.python.org/packages/source/u/urwid/urwid-$pkgver.tar.gz)
md5sums=('2e1a005cb31368fe21bfeba2d6ad5a5c')

build() {
  cp -r urwid-$pkgver pypy-urwid-$pkgver

  cd "$srcdir/urwid-$pkgver"
  sed -i 's#bin/python#bin/pypy3#' urwid/*.py
  pypy3 setup.py build

  cd "$srcdir/pypy-urwid-$pkgver"
  sed -i 's#bin/python#bin/pypy#' urwid/*.py
  
  pypy setup.py build
}

package_pypy3-urwid() {
  depends=('pypy3')

  cd "$srcdir/urwid-$pkgver"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
}

package_pypy-urwid() {
  depends=('pypy')
 
  cd "$srcdir/pypy-urwid-$pkgver"
  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
}
