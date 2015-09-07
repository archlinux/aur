# $Id: PKGBUILD 179889 2013-03-11 02:36:11Z dan $
# Contributor: Michael Beasley <youvegotmoxie@gmail.com
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=('pypy-virtualenv' 'pypy3-virtualenv')
pkgver=13.1.2
pkgrel=1
pkgdesc="Virtual Python Environment builder for pypy"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('pypy' 'pypy3')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('b989598f068d64b32dead530eb25589a')
sha256sums=('aabc8ef18cddbd8a2a9c7f92bc43e2fea54b1147330d65db920ef3ce9812e3dc')

package_pypy-virtualenv() {
  depends=('pypy')

  cd "$srcdir/virtualenv-$pkgver"

  pypy setup.py build
  pypy setup.py install --root="$pkgdir"

  mkdir -p "${pkgdir}"/usr/bin

  # link to a version with 2 suffix as well
  ln "$pkgdir/opt/pypy/bin/virtualenv" "$pkgdir/usr/bin/virtualenv-pypy2"
  ln "$pkgdir/opt/pypy/bin/virtualenv-2.7" "$pkgdir/usr/bin/virtualenv-pypy-2.7"
  ln "$pkgdir/usr/bin/virtualenv-pypy2" "$pkgdir/usr/bin/virtualenv-pypy"

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pypy3-virtualenv() {
  depends=('pypy3')

  cd "$srcdir/virtualenv-$pkgver"

  pypy3 setup.py build
  pypy3 setup.py install --root="$pkgdir"

  mkdir -p "${pkgdir}"/usr/bin

  # link to a version with 2 suffix as well
  ln "$pkgdir/opt/pypy3/bin/virtualenv" "$pkgdir/usr/bin/virtualenv-pypy3"
  ln "$pkgdir/opt/pypy3/bin/virtualenv-3.2" "$pkgdir/usr/bin/virtualenv-pypy-3.2"

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
