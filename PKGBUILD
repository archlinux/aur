# Maintainer: dustball <sebastiansonne at hush dot com>

pkgname=pypy3-pip
pkgver=7.1.2
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

md5sums=('3823d2343d9f3aaab21cf9c917710196')
sha256sums=('ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477')
