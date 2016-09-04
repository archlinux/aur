# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=pyg3t
pkgver=0.5.0
pkgrel=1
pkgdesc="Python gettext Translation Toolkit"
arch=(any)
url="https://github.com/pyg3t/pyg3t"
license=('GPL')
depends=('python2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('89b67b54a08a7bd465d9ed69fd11dcb2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
    # fix python2 calls
  PYTHON_CALLERS="$(grep -R 'python$' --exclude-dir=build | cut -d: -f1)"
  sed -i -e 's|env python$|env python2|' \
         -e 's|bin/python$|bin/python2|' \
         ${PYTHON_CALLERS}

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
