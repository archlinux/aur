# Maintainer: dustball <sebastiansonne at hush dot com>

pkgname=pypy3-pip
pkgver=8.1.2
pkgrel=1
pkgdesc="An easy_install replacement for installing pypi python packages"
url="http://www.pip-installer.org/"
arch=('any')
license=('MIT')
depends=('pypy3' 'pypy3-setuptools')
source=(https://pypi.python.org/packages/e7/a8/7556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13/pip-8.1.2.tar.gz#md5=87083c0b9867963b29f7aba3613e8f4a)

package_pypy3-pip() {

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

md5sums=('87083c0b9867963b29f7aba3613e8f4a')
sha256sums=('4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732')
