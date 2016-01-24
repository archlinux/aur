# Maintainer: dustball <sebastiansonne at hush dot com>

pkgname=pypy3-pip
pkgver=8.0.2
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

md5sums=('3a73c4188f8dbad6a1e6f6d44d117eeb')
sha256sums=('46f4bd0d8dfd51125a554568d646fe4200a3c2c6c36b9f2d06d2212148439521')
