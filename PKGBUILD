# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=python2-clint-git
_pkgname=clint
pkgver=0.3.3.28.gf1ab574
pkgrel=1
pkgdesc="Python Command-line Application Tools "
arch=('any')
url="http://pypi.python.org/pypi/clint/"
license=('custom:isc')
depends=('python2')
makedepends=('git')
conflicts=('python2-clint')
provides=('python2-clint')
source=("$_pkgname::git+https://github.com/kennethreitz/clint.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root=$pkgdir
  sed -i 's#/usr/bin/env python#/usr/bin/env python2#' "$pkgdir/usr/lib/python2.7/site-packages/clint/packages/appdirs.py"

  install -Dm644 LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README.rst \
        ${pkgdir}/usr/share/doc/${pkgname}/README.rst
  install -Dm644 HISTORY.rst \
        ${pkgdir}/usr/share/doc/${pkgname}/HISTORY.rst
}

# vim:set ts=2 sw=2 sts=2 et:
