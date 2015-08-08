# $Id$
# Maintainer: Marek Petrik <marekpetrik@gmail.com>

pkgname=pypy3-pip
pkgver=6.0.8
pkgrel=1
pkgdesc="An easy_install replacement for installing pypi python packages"
url="http://www.pip-installer.org/"
arch=('any')
license=('MIT')
makedepends=('pypy3' 'pypy3-setuptools')
source=(http://pypi.python.org/packages/source/p/pip/pip-${pkgver}.tar.gz)

package_pypy3-pip() {
  depends=('pypy3')

  cd "$srcdir/pip-$pkgver"
  pypy3 setup.py build
  pypy3 setup.py install --prefix=/opt/pypy3/ --root="$pkgdir"

  mkdir -p "$pkgdir/usr/bin/"
  mv "$pkgdir/opt/pypy3/bin/pip" "$pkgdir/usr/bin/pip-pypy3"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env pypy3|" \
    ${pkgdir}/opt/pypy3/site-packages/pip/__init__.py
  
  install -D -m644 LICENSE.txt \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('2332e6f97e75ded3bddde0ced01dbda3')
sha256sums=('0d58487a1b7f5be2e5e965c11afbea1dc44ecec8069de03491a4d0d6c85f4551')
