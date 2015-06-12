# $Id: PKGBUILD 179889 2013-03-11 02:36:11Z dan $
# Maintainer: Michael Beasley <youvegotmoxie@gmail.com
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname='pypy-virtualenv'
pkgver=13.0.3
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="http://www.virtualenv.org/"
arch=('any')
license=('MIT')
depends=('pypy' 'pypy3')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('cd2043ea72448d65dcc54d33744c2214')

package() {
  cd "$srcdir/virtualenv-$pkgver"
  pypy setup.py build
  pypy setup.py install --root="$pkgdir"

  install -D -m755 "$pkgdir/opt/pypy/bin/virtualenv" "$pkgdir/usr/bin/virtualenv-pypy"

  # should report this upstream as still not fixed...
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    $pkgdir/opt/pypy/site-packages/virtualenv.py
 
  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
