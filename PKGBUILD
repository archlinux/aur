# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyg3t
pkgname=$_name-git
pkgver=0.5.1.r305.2099281
pkgrel=1
pkgdesc="Python GetText Translation Toolkit"
arch=(any)
url="https://github.com/pyg3t/pyg3t"
license=('GPL')
depends=('python2-dateutil')
makedepends=('git')
provides=($_name)
conflicts=($_name)
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"

  v="$(grep version pyg3t/__init__.py | cut -d\' -f2)"
  r="$(git rev-list --count HEAD)"
  h="$(git rev-parse --short HEAD)"
  printf "$v.r$r.$h"
}

package() {
  cd "$srcdir/$_name"

    # fix python2 calls
  PYTHON_CALLERS="$(grep -R 'python$' --exclude-dir=build | cut -d: -f1)"
  sed -i -e 's|env python$|env python2|' \
         -e 's|bin/python$|bin/python2|' \
         ${PYTHON_CALLERS}
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

